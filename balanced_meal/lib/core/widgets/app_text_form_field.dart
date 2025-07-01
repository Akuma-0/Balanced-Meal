import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? constantPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  const AppTextFormField({
    super.key,
    this.backgroundColor,
    this.constantPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.inputTextStyle,
    this.hintStyle,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            constantPadding ??
            EdgeInsets.symmetric(horizontal:12.w, vertical: 12.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorsManager.mainOrange,
                width: 1,
              ),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorsManager.lightGray,
                width: 1,
              ),
            ),
        hintStyle: TextStyles.font16MidGrayRegular.copyWith(
                    fontFamily: 'questrial',
                  ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
      obscureText: obscureText,
      cursorColor: ColorsManager.mainOrange,
      style: TextStyles.font16LightBlackMedium,
    );
  }
}
