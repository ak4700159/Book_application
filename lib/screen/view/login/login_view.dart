import 'package:book/screen/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  LoginViewModel loginViewModel = LoginViewModel(id: "id", passwd: "passwd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인 화면',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.book),
              Text(
                '나만의 도서관리 어플리케이션',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // 폼필드 작성
        ],
      ),
    );
  }
}
