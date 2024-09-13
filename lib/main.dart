import 'package:flutter/material.dart';
import 'package:food/screens/loginScreen.dart';
import 'package:food/screens/offersScreen.dart';
import 'package:food/screens/onboardingScreen.dart';
import 'package:food/screens/selectAreaScreen.dart';
import 'package:food/screens/welcomeScreen.dart';
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
      home: const OffersScreen(),
      // routes: {
      //   '/loginScreen': (context) => const Loginscreen(), // Define the login screen route
      //   '/onboardingScreen': (context) => const OnboardingScreen(), // Define the onboarding screen route
      //   '/welcomeScreen': (context) => const WelcomeScreen(), // Define the onboarding screen route
      // },
    );
  }
}
