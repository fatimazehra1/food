import 'package:flutter/material.dart';
import 'package:food/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(screenHeight * 0.01),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class OffersButton extends StatelessWidget {
  const OffersButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(screenHeight * 0.015),
          border: Border.all(color: Colors.white, width: screenHeight * 0.003),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final String label;

  const CustomBackButton({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.black, width: screenWidth * 0.005),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        if (label.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.02),
            child: Text(
              label,
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
          ),
      ],
    );
  }
}

class SecondBackButton extends StatelessWidget {
  final String label;

  const SecondBackButton({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(screenHeight * 0.002),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 232, 225, 225),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.red,
              size: screenHeight * 0.02,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
