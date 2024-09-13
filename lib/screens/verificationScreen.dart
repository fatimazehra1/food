import 'package:flutter/material.dart';
import 'package:food/screens/errorUserScreen.dart';
import 'package:food/screens/welcomeScreen.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationScreen extends StatefulWidget {
  final String? mobile;

  const VerificationScreen({super.key, required this.mobile});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/login/vector.png',
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.07,
              left: screenWidth * 0.05,
            ),
              child: const CustomBackButton(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.18,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const StyledTitle('Verification'),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: WhiteText(
                      'We have sent a code to your mobile number ${widget.mobile}'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: screenHeight * 0.63,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05,
                horizontal: screenWidth * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalTitle('CODE'),
                      Row(
                        children: [
                          Text(
                            'Resend',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                          ),
                          NormalTitle(' in.50sec'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      OtpTextField(
                        numberOfFields: 4,
                        borderColor: const Color.fromARGB(255, 50, 52, 62),
                        fillColor: const Color.fromARGB(255, 230, 239, 247),
                        showFieldAsBox: true,
                        focusedBorderColor: Colors.transparent,
                        filled: true,
                        borderWidth: 1.0,
                        fieldWidth: screenWidth * 0.17, 
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.025,
                            color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        margin: EdgeInsets.all(screenWidth * 0.025),
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Verification Code"),
                                content: Text('Code entered is $verificationCode'),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StyledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => WelcomeScreen(),
                            ),
                          );
                        },
                        child: const WhiteText('Verify'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
