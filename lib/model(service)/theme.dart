import 'package:flutter/material.dart';

class BookThemeData {
  BookThemeData({required this.context});
  BuildContext context;

  ThemeData getBookMainTheme() {
    return Theme.of(context).copyWith(
      primaryColor: Colors.grey,
    );
  }
}
