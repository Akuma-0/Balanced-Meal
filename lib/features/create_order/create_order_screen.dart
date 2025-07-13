import 'dart:io';

import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:balanced_meal/features/create_order/widgets/food_card.dart';
import 'package:balanced_meal/core/helpers/price_and_calories_calculator.dart';
import 'package:balanced_meal/cubit/app_cubit.dart';
import 'package:balanced_meal/models/food_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CreateOrderScreen extends StatefulWidget {
  CreateOrderScreen({super.key});
  Map<FoodBase, int> foodCount = {};
  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  Map<String, List<FoodBase>> foodData = {};
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).loadFoodData();
  }

  @override
  Widget build(BuildContext context) {
    int maxCalories = (ModalRoute.of(context)!.settings.arguments as int);

    Widget buildFoodList(List<FoodBase> foodList) {
      return SizedBox(
        height: 220.h,
        child: ListView.builder(
          itemBuilder: (context, index) {
            FoodBase food = foodList[index];
            if (!widget.foodCount.containsKey(food)) {
              widget.foodCount[food] = 0;
            }
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: FoodCard(
                foodData: food,
                count: widget.foodCount[food]!,
                onCountChanged: (int newCount) {
                  setState(() {
                    widget.foodCount[food] = newCount;
                  });
                },
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: foodList.length,
        ),
      );
    }

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
      body: BlocBuilder<AppCubit, AppCubitState>(
        builder: (context, state) {
          if (state is FoodDataLoaded) {
            foodData = state.foodData;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 20.h,
                    ),
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
                        buildFoodList(foodData['vegetables']!),
                        SizedBox(height: 20.h),
                        Text(
                          'Meats',
                          style: TextStyles.font20BlackMedium.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                        SizedBox(height: 5.h),
                        buildFoodList(foodData['meats']!),
                        SizedBox(height: 20.h),
                        Text(
                          'Carbs',
                          style: TextStyles.font20BlackMedium.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                        SizedBox(height: 5.h),
                        buildFoodList(foodData['carbs']!),
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
                                '${(widget.foodCount.isEmpty) ? '0' : priceAndCaloriesCalculator(widget.foodCount)['totalCalories']!.toString()} Cal out of $maxCalories Cal',
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
                                '\$${(widget.foodCount.isEmpty) ? '0.0' : priceAndCaloriesCalculator(widget.foodCount)['totalPrice']!.toString()}',
                                style: TextStyles.font16OrangeMedium.copyWith(
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          AppTextButton(
                            text: 'Place order',
                            onPressed: () {
                              double totalCalories =
                                  priceAndCaloriesCalculator(
                                    widget.foodCount,
                                  )['totalCalories']!;
                              (totalCalories > maxCalories ||
                                      totalCalories == 0)
                                  ? exit
                                  : Navigator.pushNamed(
                                    context,
                                    'orderSummeryScreen',
                                    arguments: widget.foodCount,
                                  );
                            },
                            color:
                                (priceAndCaloriesCalculator(
                                              widget.foodCount,
                                            )['totalCalories']! >
                                            maxCalories ||
                                        priceAndCaloriesCalculator(
                                              widget.foodCount,
                                            )['totalCalories'] ==
                                            0)
                                    ? ColorsManager.lightGray
                                    : ColorsManager.mainOrange,
                                    textColor: (priceAndCaloriesCalculator(
                                              widget.foodCount,
                                            )['totalCalories']! >
                                            maxCalories ||
                                        priceAndCaloriesCalculator(
                                              widget.foodCount,
                                            )['totalCalories'] ==
                                            0)
                                    ? ColorsManager.midGray
                                    :Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: ColorsManager.mainOrange),
            );
          }
        },
      ),
    );
  }
}
