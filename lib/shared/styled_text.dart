import 'package:flutter/material.dart';
import 'package:food/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sen(
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.textColor,
                fontSize: 16,
                // letterSpacing: 1,
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
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sen(
            height: 1.5, textStyle: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(),
        style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.headlineMedium));
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.titleMedium));
  }
}
class NormalTitle extends StatelessWidget {
  const NormalTitle(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.titleSmall));
  }
}
class primaryText extends StatelessWidget {
  const primaryText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.bodyLarge));
  }
}
class primaryBoldText extends StatelessWidget {
  const primaryBoldText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: GoogleFonts.sen(
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700
            )));
  }
}
