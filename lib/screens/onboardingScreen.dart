import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:food/screens/loginScreen.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'All your favorites',
      'description':
          'Get all your loved foods in one place, you just place the order, we do the rest',
      'imageUrl': 'assets/images/onboarding/ob1.png',
    },
    {
      'title': 'Choose your favorite',
      'description':
          'Get all your loved foods in one place, you just place the order, we do the rest',
      'imageUrl': 'assets/images/onboarding/ob2.png',
    },
    {
      'title': 'Order from chosen chefs',
      'description':
          'Select your meals from top chefs, delivered fresh and delicious',
      'imageUrl': 'assets/images/onboarding/ob3.png',
    },
    {
      'title': 'Free delivery offers',
      'description': 'Enjoy free delivery on all your favorite meals',
      'imageUrl': 'assets/images/onboarding/ob4.png',
    },
  ];

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      buttonCarouselController.nextPage();
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider.builder(
                carouselController: buttonCarouselController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index, realIdx) {
                  return OnboardingPage(
                    title: onboardingData[index]['title']!,
                    description: onboardingData[index]['description']!,
                    imageUrl: onboardingData[index]['imageUrl']!,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  );
                },
                options: CarouselOptions(
                  height: screenHeight * 0.75,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(onboardingData.length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: _currentIndex == onboardingData.length - 1
                  ? const EdgeInsets.only(bottom: 50)
                  : const EdgeInsets.only(bottom: 0),
              child: StyledButton(
                onPressed: () {
                  if (_currentIndex == onboardingData.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const Loginscreen(),
                      ),
                    );
                  } else {
                    _nextPage();
                  }
                },
                child: _currentIndex == onboardingData.length - 1
                    ? const WhiteText('Get Started')
                    : const WhiteText('Next'),
              ),
            ),
            if (_currentIndex < onboardingData.length - 1)
              SkipButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const Loginscreen(),
                        ));
                  });
                },
                child: const StyledText('Skip'),
              ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double screenHeight;
  final double screenWidth;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.screenHeight,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: screenWidth * 0.6,
            height: screenHeight * 0.4,
          ),
        ),
        SizedBox(height: screenHeight * 0.05),
        StyledHeading(title),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(0),
          child: StyledText(description),
        ),
      ],
    );
  }
}
