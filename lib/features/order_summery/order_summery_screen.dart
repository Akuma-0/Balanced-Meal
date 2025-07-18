import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:balanced_meal/features/order_summery/widgets/food_tile.dart';
import 'package:balanced_meal/models/food_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummeryScreen extends StatefulWidget {
  const OrderSummeryScreen({super.key});

  @override
  State<OrderSummeryScreen> createState() => _OrderSummeryScreenState();
}

class _OrderSummeryScreenState extends State<OrderSummeryScreen> {
  @override
  Widget build(BuildContext context) {
    Map<FoodBase, int> foodCount =
        (ModalRoute.of(context)!.settings.arguments as Map<FoodBase, int>);

    Widget buildFoodTile(FoodBase foodData, int count) {
      return FoodTile(
        onCountChanged: (int newCount) {
          setState(() {
            foodCount[foodData] = newCount;
          });
        },
        count: count,
        foodData: foodData,
      );
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Order summary',
          style: TextStyles.font20BlackMedium.copyWith(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: foodCount.length,
                itemBuilder: (context, index) {
                  FoodBase foodData = foodCount.keys.elementAt(index);
                  int count = foodCount[foodData]!;
                  return (count > 0)
                      ? buildFoodTile(foodData, count)
                      : SizedBox();
                },
                separatorBuilder: (BuildContext context, int index) {
                  FoodBase foodData = foodCount.keys.elementAt(index);
                  int count = foodCount[foodData]!;
                  return (count > 0) ? SizedBox(height: 10.h) : SizedBox();
                },
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
              child: AppTextButton(
                text: 'Confirm',
                onPressed: () {},
                color: ColorsManager.mainOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
