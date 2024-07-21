import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class Book {
  Book(this.content,
      {required this.title,
      required this.author,
      required this.image,
      required this.publicher});

  String title;
  String author;
  String image;
  String publicher;
  String? content;

  factory Book.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'image': String image,
        'author': String author,
        'publicher': String publicher,
        'title': String title,
      } =>
        Book(
          null,
          image: image,
          author: author,
          publicher: publicher,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<List<Book>> fetchBook() async {
  final response = await http.get(Uri.parse(
      'https://6fh6doylz4.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc'));

  if (response.statusCode == 200) {
    print('요청 응답 성공');
    List<dynamic> result = jsonDecode(response.body);
    var newResult = result.map((book) => Book.fromJson(book)).toList();
    return newResult;
  } else {
    throw Exception('Failed to load book');
  }
}
