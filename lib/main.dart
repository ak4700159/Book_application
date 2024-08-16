import 'package:book/screen/view/list/list_main.dart';
import 'package:book/screen/view/login/login_view.dart';
import 'package:book/screen/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/': (context) => SplashView(),
        '/login': (context) => LoginView(),
        '/list': (context) => ListMainView(),
      },
      title: '도서 목록 관리 어플리케이션',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
    );
  }
}
