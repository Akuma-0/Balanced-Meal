import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:balanced_meal/core/widgets/food_card.dart';
import 'package:balanced_meal/cubit/app_cubit.dart';
import 'package:balanced_meal/models/food_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

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
                                '1000 Cal out of $maxCalories Cal',
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

  Widget buildFoodList(List<FoodBase> foodList) {
    return SizedBox(
      height: 220.h, // Add a fixed height constraint
      child: ListView.builder(
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: FoodCard(foodData: foodList[index]),
            ),
        scrollDirection: Axis.horizontal,
        itemCount: foodList.length,
      ),
    );
  }
}
