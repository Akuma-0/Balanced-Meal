import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/features/create_order/widgets/add_button.dart';
import 'package:balanced_meal/core/widgets/counter_widget.dart';
import 'package:balanced_meal/models/food_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class FoodCard extends StatefulWidget {
  FoodCard({
    super.key, 
    required this.foodData, 
    this.count = 0,
    this.onCountChanged,
  });
  
  FoodBase foodData;
  int count;
  final Function(int count)? onCountChanged;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  void _onCountChanged(int count) {
    setState(() {
      widget.count = count;
    });
    if (widget.onCountChanged != null) {
      widget.onCountChanged!(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
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
              child:
                  (widget.foodData.imageUrl.isNotEmpty)
                      ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/Loading.gif',
                        image: widget.foodData.imageUrl,
                        height: 108.h,
                        width: 163.w,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
                        'assets/images/no_image.png',
                        width: double.infinity,
                        height: 120.h,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.foodData.name,
                    style: TextStyles.font16BlackRegular.copyWith(
                      fontFamily: 'poppins',
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '${widget.foodData.calories} Cal',
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
                (widget.count == 0)
                    ? AddButton(onCountChanged: _onCountChanged,)
                    : CounterWidget(count: widget.count,
                      onCountChanged: _onCountChanged,
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
