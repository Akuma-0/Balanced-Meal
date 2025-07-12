import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/welcome_background.jpg',
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withValues(
                red: 0,
                green: 0,
                blue: 0,
                alpha: 0.25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Balanced Meal',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'abhayaLibre',
                    ),
                  ),
                  SizedBox(height: 450.h),
                  Text(
                    'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
                    style: TextStyles.font20GrayLight.copyWith(
                      fontFamily: 'poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  AppTextButton(
                    text: 'Order Food',
                    color: ColorsManager.mainOrange,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'userDetailsScreen',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
