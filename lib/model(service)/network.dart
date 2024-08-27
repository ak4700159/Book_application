import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book/model(service)/book.dart';
import 'package:dio/dio.dart';

// URL = 식별자를 제외한 URI 주소
// URI = 식별자까지 포함한 주소
// 식별자 = query + fragment
class MyNetwork {
  MyNetwork();
  static const String dynamoDBuri =
      "https://iv4pz4hvxa.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc";
  static const String titleCheckUri =
      "https://duix5e2k09.execute-api.ap-northeast-2.amazonaws.com/default/Book_titleCheckFunc";

  // 아래 함수가 어플이 시작되고 나서 계속해서 함수 실행된다.
// 이유가 무엇인지 감도 안잡힌다. 이유는 changeNotifier로 등록된
// 위젯에서 지속적으로 빌드함수를 재샐행하기에 발생한 것.
  Future<void> fetchBook(List<Book> books) async {
    final response = await http.get(Uri.parse(dynamoDBuri));

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

  Future<bool> titleCheck(String title) async {
    try {
      print('중복 검사 요청');
      var response =
          await Dio().get(titleCheckUri, queryParameters: {"title": title});

      // "success" 쌍따옴표 전체가 문자열 형태로 반환된다.
      // "success"의 의미는 dynamoDB에 중복된 제목이 없음을 의미한다.
      print('data : ${response.data}');
      if (response.data == '"success"') {
        return true;
      }
      return false;
    } catch (e) {
      print("네트워크 에러 발생 : $e");
      return false;
    }
  }

  Future<bool> sendHttpMsg(String method, Book book) async {
    var response;
    //var result;
    try {
      switch (method) {
        case "PUT":
          response = await Dio().put(
            dynamoDBuri,
            queryParameters: {
              "title": book.title,
              "author": book.author,
              "publicher": book.publicher,
              "image": book.image,
              "content": book.content
            },
          );
          break;

        case "DELETE":
          response = await Dio().delete(
            dynamoDBuri,
            queryParameters: {
              "title": book.title,
            },
          );
          break;

        case "POST":
          response = await Dio().post(
            dynamoDBuri,
            queryParameters: {
              "title": book.title,
              "author": book.author,
              "publicher": book.publicher,
              "image": book.image,
              "content": book.content ?? ""
            },
          );
          break;

        default:
          print('미구현 메소드');
          return false;
      }

      if (response.statusCode == 200) {
        print('네트워크 전송 성공');
        return true;
      } else {
        throw Exception("네트워크 전송 실패");
      }
    } on (DioException, Exception) catch (e) {
      print('dio : $e');
      return false;
    }
  }
}
