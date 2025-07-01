import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/helpers/font_weight_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font20GrayLight= TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.gray,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color:  Colors.white,
  );
    static TextStyle font20BlackMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
      static TextStyle font14LightBlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.lightBlack,
  );
        static TextStyle font16LightBlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.lightBlack,
  );
        static TextStyle font16MidGrayRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.midGray,
  );
}
