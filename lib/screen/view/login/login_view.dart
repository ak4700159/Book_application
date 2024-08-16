import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인 화면',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
