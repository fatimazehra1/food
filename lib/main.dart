import 'package:flutter/material.dart';
import 'package:food/splashScreen/SplashScreen.dart';
import 'package:food/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      home: const SplashScreen(),
    );
  }
}
