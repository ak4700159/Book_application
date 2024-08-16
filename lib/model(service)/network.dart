import 'package:book/model(service)/book.dart';
import 'package:dio/dio.dart';

Future<bool> titleCheck(String title) async {
  try {
    print('중복 검사 요청');
    var response = await Dio().get(
        'https://duix5e2k09.execute-api.ap-northeast-2.amazonaws.com/default/Book_titleCheckFunc',
        queryParameters: {"title": title});

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

Future<void> sendHttpMsg(String method, Book book) async {
  var response;
  //var result;
  try {
    switch (method) {
      case "PUT":
        response = await Dio().put(
            'https://6fh6doylz4.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc',
            queryParameters: {
              "title": book.title,
              "author": book.author,
              "publicher": book.publicher,
              "image": book.image,
              "content": book.content
            });
        break;

      case "DELETE":
        response = await Dio().delete(
            'https://6fh6doylz4.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc',
            queryParameters: {
              "title": book.title,
            });
        break;

      case "POST":
        response = await Dio().post(
            'https://6fh6doylz4.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc',
            queryParameters: {
              "title": book.title,
              "author": book.author,
              "publicher": book.publicher,
              "image": book.image,
              "content": book.content ?? ""
            });
        break;

      default:
        print('미구현 메소드');
        break;
    }

    if (response.statusCode == 200) {
      print('네트워크 전송 성공');
    } else {
      throw Exception("네트워크 전송 실패");
    }
  } catch (e) {
    print(e);
  }
}
