import 'package:book/model(service)/book.dart';
import 'package:book/model(service)/network.dart';
import 'package:flutter/material.dart';

class BookController with ChangeNotifier {
  // 생성자에서 Books 리스트르 초기화
  // 초기엔 비어있을 수 있다. 이를 조심해야 됨.
  final MyNetwok netwok = const MyNetwok();
  BookController() {
    initBooks();
  }

  List<Book> books = [];

  initBooks() async {
    await netwok.fetchBook(books);
    await Future.delayed(const Duration(seconds: 2), () {});
    notifyListeners();
    print(books);
  }

  void updateBook() async {
    await netwok.fetchBook(books);
    notifyListeners();
  }

  void deleteBook(String title) async {
    bool result = await netwok.sendHttpMsg(
        'DELETE',
        Book(
          "",
          title: title,
          image: "",
          author: "",
          publicher: "",
        ));
    if (result) {
      books.removeWhere((book) => book.title == title);
      notifyListeners();
    }
  }

  void insertBook(Book book) {
    books.add(book);
    notifyListeners();
  }

  void sortBook(bool asent) {
    if (asent == true) {
      books.sort((a, b) => a.title.length.compareTo(b.title.length));
    } else {
      books.sort((a, b) => b.title.length.compareTo(a.title.length));
    }
    notifyListeners();
  }

  void modifyBook(Book book) {
    for (int i = 0; i < books.length; i++) {
      if (books[i].title == book.title) {
        books[i] = book;
      }
    }
    notifyListeners();
  }

  void toggleSelected(int index) {
    books[index].isChecked = !(books[index].isChecked ?? false);
    notifyListeners();
  }

  void checkAll() {
    books.forEach((book) {
      book.isChecked = true;
    });
    notifyListeners();
  }

  void deleteCheckedBook() {
    books.removeWhere((book) => book.isChecked == true);
    notifyListeners();
  }
}
