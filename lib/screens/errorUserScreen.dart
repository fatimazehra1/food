import 'package:flutter/material.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';

class ErrorUserScreen extends StatefulWidget {
  const ErrorUserScreen({super.key});

  @override
  State<ErrorUserScreen> createState() => _ErrorUserScreenState();
}

class _ErrorUserScreenState extends State<ErrorUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 70,
            left: 20,
            child: SecondBackButton(),
          ),
           Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(children: [
                    Image.asset('assets/images/error.png'),
                    const StyledText(
                      'You\'re not registered as a patient at Ziauddin Hospital. Please register or contact support for assistance.',
                    ),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
