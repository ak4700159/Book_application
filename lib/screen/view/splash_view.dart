import 'package:book/screen/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // context 가 필요한 뷰모델이기에 Riverpod로 선언하지 않았다.
    SplashViewModel splashViewModel = SplashViewModel(context: context);
    splashViewModel.moveScreen();
    return Center(
      child: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '로딩중입니다! 조금만 기다려주세요',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.black,
              semanticsLabel: "로딩 ~~ 로딩 ~~",
            ),
          ],
        )),
      ),
    );
  }
}
