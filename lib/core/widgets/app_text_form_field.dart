import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? constantPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? inputTextStyle;
  Function(String)? onChanged = (_) {};
  String? Function(String?)? validator=(_)=>'';
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  AppTextFormField({
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
    this.onChanged,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            constantPadding ??
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
        errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
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
