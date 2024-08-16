import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 내부 저장소를 활용해서 이전에 로그인했는지 여부를 확인한다.
// 추가로 나중에 시간이 된다면 JWT 토큰을 발행해 로그인의 유효성을 확인해보자

class SplashViewModel {
  SplashViewModel({required this.context});
  late bool _isLogin;
  BuildContext context;

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLogin = prefs.getBool('isLogin') ?? false;
    // 스플래시 화면 잘뜨는지 확인하기 위해 일부러 시간을 지연
    await Future.delayed(Duration(seconds: 2), () {});
    return _isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((_isLogin) {
      if (_isLogin) {
        Navigator.pushNamedAndRemoveUntil(context, '/list', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    });
  }
}
