import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onCountChanged});
  final Function(int count) onCountChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 65.w,
      child: ElevatedButton(
        onPressed: () {
          onCountChanged(1); // Example action, replace with actual logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.mainOrange,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: TextStyles.font16WhiteRegular.copyWith(
            fontFamily: 'poppins',
          ),
        ),
        child: Text('Add'),
      ),
    );
  }
}
