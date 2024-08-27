import 'package:book/model(service)/book_controller.dart';
import 'package:book/screen/view/list/book_detail_view.dart';
import 'package:book/screen/view/list/list_main.dart';
import 'package:book/screen/view/login/login_view.dart';
import 'package:book/screen/view/splash_view.dart';
import 'package:book/screen/view_model/list_view_model.dart';
import 'package:book/screen/view_model/login_view_model.dart';
import 'package:book/test_ground/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(const BookApp());
}

// 휴대폰 사이즈에 맞게 UI 크기와 폰트사이즈 조절
// 추가로 사용자 정의 테마 클래스 만들기 -> 일관된 테마 유지 + 유지 보수에 용이
class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (_, child) {
        return const BookApp();
      },
    );
  }
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>.value(value: Counter()),
        Provider<LoginViewModel>.value(
            value: LoginViewModel(id: "5645164", passwd: "1234")),
        ChangeNotifierProvider<BookController>.value(value: BookController()),
        ChangeNotifierProvider<ListViewModel>.value(value: ListViewModel()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashView(),
          '/login': (context) => LoginView(),
          '/list': (context) => const ListMainView(),
          '/list/detail': (context) => DetailBookView(),
          // 'list/create' : (context) => CreateBookView(),
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
