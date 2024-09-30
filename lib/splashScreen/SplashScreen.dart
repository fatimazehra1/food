import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food/screens/onboardingScreen.dart';
import 'package:food/screens/homeScreen.dart'; 
import 'package:food/screens/loginScreen.dart'; 
import 'package:food/service/data_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadDataAndNavigate();
  }

  Future<void> _loadDataAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    // Load API data
    await DataService().loadApiData();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isFirstRun) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } else if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Loginscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/splash/splash_screen.png'),
      ),
    );
  }
}
