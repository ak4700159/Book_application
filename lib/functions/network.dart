import 'package:book/models/book.dart';
import 'package:dio/dio.dart';

bool titleCheck(String title) {
  try {
    print('중복 검사 요청');
    bool status = false;
    Future response = Dio().get(
        'https://duix5e2k09.execute-api.ap-northeast-2.amazonaws.com/default/Book_titleCheckFunc',
        queryParameters: {"title": title});

    // "success" 쌍따옴표 전체가 문자열 형태로 반환된다.
    // "success"의 의미는 DB에 중복된 제목이 없음을 의미한다.
    response.then((r) {
      if (r.data == '"success"') {
        status = true;
      }
      status = false;
    });
    return status;
  } catch (e) {
    print("네트워크 에러 발생 : $e");
    return false;
  }
}

Future<void> postBook(Book book) async {
  try {
    var response = await Dio().post(
        'https://6fh6doylz4.execute-api.ap-northeast-2.amazonaws.com/default/Book_dyamondDBFunc',
        queryParameters: {
          "title": book.title,
          "author": book.author,
          "publicher": book.publicher,
          "image": book.image,
          "content": book.content
        });
    if (response.statusCode == 200) {
      print('네트워크 전송 성공');
    }
  } catch (e) {
    print("네트워크 에러 발생 : $e");
  }
}
