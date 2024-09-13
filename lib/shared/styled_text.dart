import 'package:flutter/material.dart';
import 'package:food/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.02;

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sen(
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.textColor,
                fontSize: fontSize, 
              ),
        ),
      ),
    );
  }
}

class WhiteText extends StatelessWidget {
  const WhiteText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.02;

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sen(
          height: 1.5,
          textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSize, 
              ),
        ),
      ),
    );
  }
}

class WhiteHeading extends StatelessWidget {
  const WhiteHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.04;

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sen(
          textStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: fontSize, 
              ),
        ),
      ),
    );
  }
}

class whiteMediumText extends StatelessWidget {
  const whiteMediumText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.017;

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sen(
          textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: fontSize, 
              ),
        ),
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.033;

    return Text(
      text.toUpperCase(),
      style: GoogleFonts.sen(
        textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: fontSize, 
            ),
      ),
    );
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.03;

    return Text(
      text,
      style: GoogleFonts.sen(
        textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: fontSize, 
            ),
      ),
    );
  }
}

class NormalTitle extends StatelessWidget {
  const NormalTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.017;

    return Text(
      text,
      style: GoogleFonts.sen(
        textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: fontSize, 
            ),
      ),
    );
  }
}

class primaryText extends StatelessWidget {
  const primaryText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.017;

    return Text(
      text,
      style: GoogleFonts.sen(
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: fontSize, 
            ),
      ),
    );
  }
}

class primaryBoldText extends StatelessWidget {
  const primaryBoldText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.017;

    return Text(
      text,
      style: GoogleFonts.sen(
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
      ),
    );
  }
}
