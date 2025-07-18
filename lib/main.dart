import 'package:balanced_meal/balanced_meal_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

await ScreenUtil.ensureScreenSize();
  runApp(
    BalancedMealApp()
  );
}
