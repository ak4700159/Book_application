import 'package:book/main.dart';
import 'package:book/screen/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaclLoginViewModel = ref.read(loginViewModel);
    final loacalBookController = ref.read(notifierBookController);
    loacalBookController.initBooks();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인 화면 [id : ${loaclLoginViewModel.id}, pwd : ${loaclLoginViewModel.passwd}]',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                color: Colors.blueAccent,
              ),
              Text(
                '나만의 도서관리 어플리케이션',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ],
          ),
          // 폼필드 작성

          // 바로 가기 버튼
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/list', (route) => false);
              },
              child: const Text('넘어가기'))
        ],
      ),
    );
  }
}
