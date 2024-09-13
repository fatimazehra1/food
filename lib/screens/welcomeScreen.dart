import 'package:flutter/material.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<String?> getNameFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/welcome.png'),
                      const SizedBox(height: 20),
                      FutureBuilder<String?>(
                        future: getNameFromPreferences(),
                        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data == null) {
                            return const StyledHeading('Hello Guest!');
                          } else {
                            return StyledHeading('Hello ${snapshot.data}');
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      const StyledText(
                        'Welcome to Food Lounge. Enjoy exploring and discovering delicious delights!',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: StyledButton(
                  onPressed: () {},
                  child: const WhiteText('Continue'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
