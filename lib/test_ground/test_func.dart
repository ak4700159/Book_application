import 'package:book/functions/network.dart';
import 'package:book/models/book.dart';
import 'dart:async';

// 임의로 데이터 100ro tkrdl
void createData() async {
  for (int i = 0; i < 100; i++) {
    await sendHttpMsg('POST',
        Book('', title: '$i', author: '$i', image: '$i', publicher: ''));
  }
}

void deleteData() async {
  for (int i = 0; i < 100; i++) {
    Future.delayed(Duration(seconds: 1));
    await sendHttpMsg('DELETE',
        Book('', title: '$i', author: '$i', image: '$i', publicher: ''));
  }
}
