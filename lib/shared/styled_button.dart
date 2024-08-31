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
    return TextButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          alignment: Alignment.center,
          child: child,
        ));
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
        )
      );
  }
}
