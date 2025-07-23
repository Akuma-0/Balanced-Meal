import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/counter_widget.dart';
import 'package:balanced_meal/models/food_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTile extends StatefulWidget {
  FoodTile({
    super.key,
    required this.onCountChanged,
    required this.foodData,
    this.count = 0,
  });
  int count;
  final Function(int count)? onCountChanged;
  final FoodBase foodData;

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    void _onCountChanged(int count) {
      setState(() {
        widget.count = count;
      });
      if (widget.onCountChanged != null) {
        widget.onCountChanged!(count);
      }
    }

    return Container(
      width: 327.w,
      height: 78.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child:
                  (widget.foodData.imageUrl.isNotEmpty)
                      ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/Loading.gif',
                        image: widget.foodData.imageUrl,
                        width: 76.w,
                        height: 62.h,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
                        'assets/images/no_image.png',
                        width: 76.w,
                        height: 62.h,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(width: 10.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 122.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.foodData.name,
                        style: TextStyles.font16BlackRegular.copyWith(
                          fontFamily: 'Poppins',
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        '${widget.foodData.calories} Cal',
                        style: TextStyles.font14MidGrayRegular.copyWith(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$12',
                      style: TextStyles.font16BlackMedium.copyWith(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    CounterWidget(
                      count: widget.count,
                      onCountChanged: _onCountChanged,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
