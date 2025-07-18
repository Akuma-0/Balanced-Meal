import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        fixedSize: WidgetStatePropertyAll(Size(double.infinity, 60)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        backgroundColor: WidgetStatePropertyAll(color),
      ),
      child: Text(
        text,

        style: TextStyles.font16WhiteMedium.copyWith(
          fontFamily: 'Poppins',
          color: textColor,
        ),
      ),
    );
  }
}
