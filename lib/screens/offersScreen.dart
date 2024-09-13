import 'package:flutter/material.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        AlertDialog(
          backgroundColor: AppColors.buttonColor,
          content: Container(
            width: screenWidth * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -screenHeight * 0.04,
                      right: -screenWidth * 0.05,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(screenHeight * 0.015),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:  Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Icon(Icons.close,
                              color: AppColors.primaryColor,
                              size: screenHeight * 0.027),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: Image.asset(
                        'assets/images/offers_screen.png',
                        fit: BoxFit.contain,
                        width: screenWidth * 0.7, 
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.09), 

                          const WhiteHeading(
                            'Hurry Offers!',
                          ),
                          SizedBox(height: screenHeight * 0.03), 
                          const WhiteHeading(
                            '#1243CD2',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const whiteMediumText(
                  'Use the coupon and get 25% discount.',
                ),
              ],
            ),
          ),
          actions: [
            OffersButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const WhiteText(
                'GOT IT',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
