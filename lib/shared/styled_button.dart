import 'package:flutter/material.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
            border: Border.all(color: Colors.black, width: screenWidth * 0.005),
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

class primaryBackButton extends StatelessWidget {
  final String label;

  const primaryBackButton({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(screenHeight * 0.005),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 232, 225, 225),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: screenHeight * 0.025,
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

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(screenHeight * 0.005),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 232, 225, 225),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.menu,
              color: const Color.fromARGB(255, 0, 0, 0),
              size: screenHeight * 0.03,
            ),
          ),
        ),
      ],
    );
  }
}

class CartButton extends StatelessWidget {
  final String label;

  const CartButton({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(screenHeight * 0.005),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: const Color.fromARGB(255, 255, 255, 255),
              size: screenHeight * 0.03,
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

class arrowDown extends StatelessWidget {
  final String label;

  const arrowDown({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return IconButton(
      icon: Icon(
        Icons.arrow_drop_down,
        color: const Color.fromARGB(255, 0, 0, 0),
        size: screenHeight * 0.03,
      ),
      onPressed: () async {
        Navigator.pop(context);
      },
    );
  }
}

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Secondarylabel('See All'),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
              size: screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenHeight * 0.035,
        height: screenHeight * 0.04,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: screenHeight * 0.02,
          ),
        ),
      ),
    );
  }
}

class ModifiersSelectedButton extends StatelessWidget {
  const ModifiersSelectedButton(
      {super.key, required this.onPressed, required this.child});
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.height * 0.015;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.005, horizontal: screenWidth * 0.03),
        margin: EdgeInsets.only(bottom: screenHeight * 0.008),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DefaultTextStyle(
          style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: fontSize,
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class ModifiersButton extends StatelessWidget {
  const ModifiersButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.textStyle,
  });

  final Function() onPressed;
  final Widget child;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.height * 0.015;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.005,
          horizontal: screenWidth * 0.03,
        ),
        margin: EdgeInsets.only(bottom: screenHeight * 0.008),
        decoration: BoxDecoration(
          color: AppColors.greyAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DefaultTextStyle(
          style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: fontSize,
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}
