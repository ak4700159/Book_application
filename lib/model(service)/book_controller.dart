import 'dart:convert';
import 'package:book/screen/view_model/list_view_model.dart';
import 'package:http/http.dart' as http;

import 'package:book/model(service)/book.dart';
import 'package:book/model(service)/network.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

// BookController 클래스는 Book 데이터들을 리스트 형태로 관리하는 모델이다.
class BookController with ChangeNotifier {
  final BookNetwork network = BookNetwork();
  // 초기엔 빈리스트를 가지고 있다.
  // 이 어플에선 books에 데이터를 무조건 들어와 있다고 가정함.
  List<Book> books = [];

  // 생성자에서 Books 리스트르 초기화 + 리스트뷰에서 사용될 상태 초기화
  BookController() {
    initBooks();
    notifyListeners();
  }

  initBooks() async {
    await network.fetchBook(books);
    //await Future.delayed(const Duration(seconds: 5), () {});
    print('컨트롤러 초기화');
  }

  void updateBook() async {
    await network.fetchBook(books);
    notifyListeners();
  }

  void deleteBook(String title) async {
    bool result = await network.sendHttpMsg(
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
    }
    notifyListeners();
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
}
