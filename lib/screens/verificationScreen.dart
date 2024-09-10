import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Stack(
        
        children: [
          
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/login/vector.png',
              width: 177,
              height: 177,
              fit: BoxFit.contain,
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child:  Padding(
              padding: EdgeInsets.only( top : 70 , left: 20),
              child: CustomBackButton()), 
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const StyledTitle('Verification'),
                Padding(
                  padding: const EdgeInsets.all(15),
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
              height: MediaQuery.of(context).size.height * 0.63,
              padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 24),
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
                        fieldWidth: 80,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        margin: const EdgeInsets.all(10),
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
                            // Handle verification here
                          },
                          child: const WhiteText('Verify')),
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
