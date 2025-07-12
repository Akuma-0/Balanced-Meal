import 'package:balanced_meal/core/routing/routes.dart';
import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Balanced Meal',
          theme: ThemeData(
            primaryColor: ColorsManager.mainOrange,
            scaffoldBackgroundColor: Color(0xffFBFBFB),
          ),
          routes: routes,
          initialRoute: 'welcomeScreen',
        ),
      ),
    );
  }
}
