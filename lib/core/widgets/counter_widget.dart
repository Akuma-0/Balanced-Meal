import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CounterWidget extends StatefulWidget {
  CounterWidget({super.key, required this.count, required this.onCountChanged});
  int count;
  final Function(int count) onCountChanged;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 77.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.remove, size: 16.0),
              onPressed: () {
                if (widget.count > 0) {
                  setState(() {
                    widget.count--;
                    widget.onCountChanged(widget.count);
                  });
                  
                }
              },
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: ColorsManager.mainOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${widget.count}', // Replace with actual counter value
              style: TextStyles.font16BlackMedium.copyWith(
                fontFamily: 'Poppins',
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.add, size: 16.0),
              onPressed: () {
                setState(() {
                  widget.count++;
                  widget.onCountChanged(widget.count);
                });
              },
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: ColorsManager.mainOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
