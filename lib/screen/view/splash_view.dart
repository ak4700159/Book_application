import 'package:book/screen/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    SplashViewModel splashViewModel = SplashViewModel(context: context);
    splashViewModel.moveScreen();
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
