import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.remove, size: 16.0),
              onPressed: () {},
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: ColorsManager.mainOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              '1', // Replace with actual counter value
              style: TextStyles.font16BlackMedium.copyWith(
                fontFamily: 'poppins',
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.add, size: 16.0),
              onPressed: () {},
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: ColorsManager.mainOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
