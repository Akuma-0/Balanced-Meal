import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:balanced_meal/core/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.lightGray,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create your order',
          style: TextStyles.font20BlackMedium.copyWith(fontFamily: 'poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vegetables',
                    style: TextStyles.font20BlackMedium.copyWith(
                      fontFamily: 'poppins',
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //add 5 food card widgets
                        FoodCard(), SizedBox(width: 12.w), FoodCard(),
                        SizedBox(width: 12.w), FoodCard(),
                        SizedBox(width: 12.w), FoodCard(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Meats',
                    style: TextStyles.font20BlackMedium.copyWith(
                      fontFamily: 'poppins',
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //add 5 food card widgets
                        FoodCard(), SizedBox(width: 12.w), FoodCard(),
                        SizedBox(width: 12.w), FoodCard(),
                        SizedBox(width: 12.w), FoodCard(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Carbs',
                    style: TextStyles.font20BlackMedium.copyWith(
                      fontFamily: 'poppins',
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //add 5 food card widgets
                        FoodCard(), SizedBox(width: 12.w), FoodCard(),
                        SizedBox(width: 12.w), FoodCard(),
                        SizedBox(width: 12.w), FoodCard(),
                      ],
                    ),
                  ),
                  SizedBox(height: 180.h),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 16.h,
                bottom: 24.h,
              ),
              decoration: BoxDecoration(color: Colors.white),
              child: SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cal',
                          style: TextStyles.font16BlackRegular.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                        Text(
                          '1000 Cal out of 2000 Cal',
                          style: TextStyles.font14MidGrayRegular.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TextStyles.font16BlackRegular.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                        Text(
                          '125 \$',
                          style: TextStyles.font16OrangeMedium.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AppTextButton(
                      text: 'Place order',
                      onPressed: () {},
                      color: ColorsManager.mainOrange,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
