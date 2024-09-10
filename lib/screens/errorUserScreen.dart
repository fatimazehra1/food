import 'package:flutter/material.dart';
import 'package:food/shared/styled_text.dart';

class ErrorUserScreen extends StatefulWidget {
  const ErrorUserScreen({super.key});

  @override
  State<ErrorUserScreen> createState() => _ErrorUserScreenState();
}

class _ErrorUserScreenState extends State<ErrorUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/error.png'),
          const StyledText('Youre not registered as a patient at Ziauddin Hospital. Please register or contact support for assistance.')
        ],
      ),
    );
  }
}
