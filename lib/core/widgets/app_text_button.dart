import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextButton extends StatelessWidget {
  AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  Color? textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        backgroundColor: WidgetStatePropertyAll(color),
      ),
      child: Text(
        text,

        style: TextStyles.font16WhiteMedium.copyWith(
          fontFamily: 'poppins',
          color: textColor,
        ),
      ),
    );
  }
}
