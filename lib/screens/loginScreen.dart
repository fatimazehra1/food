import 'package:flutter/material.dart';
import 'package:food/models/Employee.dart';
import 'package:food/models/patient.dart';
import 'package:food/models/student.dart';
import 'package:food/providers/authProvider.dart';
import 'package:food/screens/errorUserScreen.dart';
import 'package:food/screens/verificationScreen.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String message = '';
  String _selectedValue = 'employee';
  bool _isChecked = false;
  final TextEditingController _cardNoController = TextEditingController();

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
          Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15, 
            // left: MediaQuery.of(context).size.width * 0.04, 
            // right: MediaQuery.of(context).size.width * 0.04, 
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StyledTitle(
                _selectedValue == 'employee'
                    ? 'Log In As Employee'
                    : _selectedValue == 'student'
                        ? 'Log In As Student'
                        : 'Log In As Patient',
              ),
              Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * 0.02, 
                ),
                child: const WhiteText(
                  'Please log in as a patient using your existing account details.',
                ),
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
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: NormalTitle('LOGIN AS:'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(bottom: 60)),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.9, // Scale down the radio button size
                            child: Radio(
                              activeColor: AppColors.primaryColor,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return AppColors.primaryColor;
                                }
                                return AppColors.primaryColor;
                              }),
                              value: 'patient',
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          const NormalTitle('Patient'),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.9,
                            child: Radio(
                              activeColor: AppColors.primaryColor,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return AppColors.primaryColor;
                                }
                                return AppColors.primaryColor;
                              }),
                              value: 'employee',
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          const NormalTitle('Employee'),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.9,
                            child: Radio(
                              activeColor: AppColors.primaryColor,
                              value: 'student',
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return AppColors.primaryColor;
                                }
                                return AppColors.primaryColor;
                              }),
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          const NormalTitle('Student'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 14),
                      ),
                      NormalTitle(
                        _selectedValue == 'employee'
                            ? 'EMPLOYEE CARD#'
                            : _selectedValue == 'student'
                                ? 'STUDENT CARD#'
                                : 'MR#',
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _cardNoController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(172, 240, 245, 250)),
                          ),
                          labelText: _selectedValue == 'employee'
                              ? 'EMPLOYEE CARD#'
                              : _selectedValue == 'student'
                                  ? 'STUDENT CARD#'
                                  : 'MR#',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(82, 0, 0, 0),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(172, 240, 245, 250),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),
                              const NormalTitle('Remember me'),
                            ],
                          ),
                          const primaryText('Forgot password'),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StyledButton(
                            onPressed: () async {
                              String cardNo = _cardNoController.text.trim();

                              if (cardNo.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Please enter your card number'),
                                  ),
                                );
                                return;
                              }

                              try {
                                AuthProvider authProvider = AuthProvider();
                                if (_selectedValue == 'employee') {
                                  Employee? response =
                                      await authProvider.employeeLogin(cardNo);

                                  if (response != null &&
                                      response.email != null) {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setString(
                                        'name', response.employeeName ?? '');
                                    await prefs.setString(
                                        'mobile', response.mobile ?? '');
                                    await prefs.setString(
                                        'address', response.address ?? '');
                                    await prefs.setString(
                                        'email', response.email ?? '');
                                    await prefs.setBool('isLoggedIn', true);

                                    // print('Name: ${response.employeeName}');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => VerificationScreen(
                                            mobile: response.mobile),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            const ErrorUserScreen(),
                                      ),
                                    );
                                  }
                                } else if (_selectedValue == 'patient') {
                                  Patient? response =
                                      await authProvider.patientLogin(cardNo);

                                  if (response != null &&
                                      response.email != null) {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setString(
                                        'name', response.patientName ?? '');
                                    await prefs.setString(
                                        'mobile', response.mobile ?? '');
                                    await prefs.setString(
                                        'address', response.address ?? '');
                                    await prefs.setString(
                                        'email', response.email ?? '');
                                    await prefs.setBool('isLoggedIn', true);

                                    // print('Name: ${response.employeeName}');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => VerificationScreen(
                                            mobile: response.mobile),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            const ErrorUserScreen(),
                                      ),
                                    );
                                  }
                                } else if (_selectedValue == 'student') {
                                  Student? response =
                                      await authProvider.studentLogin(cardNo);

                                  if (response != null &&
                                      response.email != null) {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setString(
                                        'name', response.studentName ?? '');
                                    await prefs.setString(
                                        'mobile', response.mobile ?? '');
                                    await prefs.setString(
                                        'address', response.address ?? '');
                                    await prefs.setString(
                                        'email', response.email ?? '');
                                    await prefs.setBool('isLoggedIn', true);

                                    // print('Name: ${response.employeeName}');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => VerificationScreen(
                                            mobile: response.mobile),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            const ErrorUserScreen(),
                                      ),
                                    );
                                  }
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('An error occurred: $e'),
                                  ),
                                );
                              }
                            },
                            child: const WhiteText('LOG IN'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const StyledText('Don’t have an account?'),
                              SkipButton(
                                onPressed: () {},
                                child: const primaryBoldText('SIGN UP'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
