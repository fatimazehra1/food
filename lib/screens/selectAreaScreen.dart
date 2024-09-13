import 'package:flutter/material.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SelectAreaPopup extends StatefulWidget {
  const SelectAreaPopup({super.key});

  @override
  State<SelectAreaPopup> createState() => _SelectAreaPopupState();
}

class _SelectAreaPopupState extends State<SelectAreaPopup> {
  Future<String?> getAddressFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('address');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      content: Container(
        width: screenWidth * 0.9, 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Image.asset(
                'assets/images/splash/logo.png',
                fit: BoxFit.contain,
                width: screenWidth * 0.4,
              ),
            ),
            SizedBox(height: screenHeight * 0.03), 
            const StyledHeading('Please Select Area.'),
            SizedBox(height: screenHeight * 0.03),
            ToggleSwitch(
              radiusStyle: true,
              minHeight: screenHeight * 0.07,
              minWidth: screenWidth * 0.3, 
              cornerRadius: screenHeight * 0.05,
              activeBgColors: [
                [AppColors.buttonColor!],
                [AppColors.buttonColor!]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: AppColors.greyAccent,
              inactiveFgColor: AppColors.buttonColor,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: ['DELIVERY', 'PICKUP'],
              onToggle: (index) {
                print('switched to: $index');
              },
              customTextStyles: [
                TextStyle(
                  fontSize: screenWidth * 0.035, 
                  fontWeight: FontWeight.bold,
                ),
                TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03), 
            FutureBuilder<String?>(
              future: getAddressFromPreferences(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const StyledHeading('Hello Guest!');
                } else {
                  return StyledText('Selected Area: ${snapshot.data}');
                }
              },
            ),
            SizedBox(height: screenHeight * 0.05), 
          ],
        ),
      ),
      actions: [
        StyledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: WhiteText(
            'SELECT'
          ),
        ),
      ],
    );
  }
}
