import 'package:book/model(service)/book_controller.dart';
import 'package:book/screen/view/list/list_main.dart';
import 'package:book/screen/view/login/login_view.dart';
import 'package:book/screen/view/splash_view.dart';
import 'package:book/screen/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginViewModel>.value(
            value: LoginViewModel(id: "5645164", passwd: "1234")),
        ChangeNotifierProvider.value(value: BookController()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => SplashView(),
          '/login': (context) => LoginView(),
          '/list': (context) => ListMainView(),
        },
        title: '도서 목록 관리 어플리케이션',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          useMaterial3: true,
        ),
        initialRoute: '/',
      ),
    );
  }
}
