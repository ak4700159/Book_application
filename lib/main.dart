import 'package:book/screens/list_screen/list_screen.dart';
import 'package:book/screens/modify_book_screen.dart';
import 'package:book/test_ground/test_func.dart';
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
        //'login_screen' : (context) => const LoginScreen(),
        //'/test_screen': (testContext) => TestScreen(),
        '/list_screen': (listContext) => const ListScreen(),
        ModifyBookScreen.routeName: (context) => const ModifyBookScreen(),
      },
      title: '도서 목록 관리 어플리케이션',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/list_screen',
    );
  }
}
