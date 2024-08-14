import 'package:book/models/book.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class Books extends GetxController {
  var books = <Book>[].obs;
  //late List<bool> isChecked;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // 값이 변경될 때마다 어떤 값이 변경되는지 확인용 log
    ever(books, (value) {
      print('books update!!');
      print('value : $value');
    });

    fetchBook();
  }

  Future<void> fetchBook() async {
    final response = await http.get(Uri.parse(
        'https://6fh6doylz4.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc'));

    if (response.statusCode == 200) {
      print('요청 응답 성공');
      List<dynamic> result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        books.add(Book.fromJson(result[i]));
      }
    } else {
      throw Exception('Failed to load book');
    }
  }

  void updateBook() async {
    fetchBook();
  }

  void deleteBook(String title) {
    books.removeWhere((book) => book.title == title);
  }

  void insertBook(Book book) {
    books.add(book);
  }

  void sortBook(bool asent) {
    if (asent == true) {
      books.sort((a, b) => a.title.length.compareTo(b.title.length));
    } else {
      books.sort((a, b) => b.title.length.compareTo(a.title.length));
    }
  }

  void modifyBook(Book book) {
    for (int i = 0; i < books.length; i++) {
      if (books[i].title == book.title) {
        books[i] = book;
      }
    }
  }

  void toggleSelected(int index) {
    books[index].isChecked = !(books[index].isChecked ?? false);
  }

  void checkAll() {
    books.forEach((book) {
      book.isChecked = true;
    });
  }

  void deleteCheckedBook() {
    books.removeWhere((book) => book.isChecked == true);
  }
}
