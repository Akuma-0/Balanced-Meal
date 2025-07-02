import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/add_button.dart';
import 'package:balanced_meal/core/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( left:5.w,top: 10.h, bottom: 10.h),
      height: 196.h,
      width: 183.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4), // x, y offset
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                'assets/images/welcome_background.jpg',
                height: 108.h,
                width: 163.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Bell Pepper',
                    style: TextStyles.font16BlackRegular.copyWith(
                      fontFamily: 'poppins',
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '12 Cal',
                  style: TextStyles.font14MidGrayRegular.copyWith(
                    fontFamily: 'poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$12',
                  style: TextStyles.font16BlackMedium.copyWith(
                    fontFamily: 'poppins',
                  ),
                ),
                AddButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
