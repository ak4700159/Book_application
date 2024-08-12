import 'package:book/screens/list_screen/list_screen.dart';
import 'package:book/screens/modify_book_screen.dart';
import 'package:book/test_ground/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(TestScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/list_screen': (context) => const ListScreen(),
        ModifyBookScreen.routeName: (context) => const ModifyBookScreen(),
      },
      title: 'Book List App 0.0.5-1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/list_screen',
    );
  }
}
