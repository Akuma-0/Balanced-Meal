import 'package:balanced_meal/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OrderSummeryScreen extends StatelessWidget {
  const OrderSummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          style: TextStyles.font20BlackMedium.copyWith(fontFamily: 'poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Order summary details will be displayed here.',
          style: TextStyles.font16BlackMedium.copyWith(fontFamily: 'poppins'),
        ),
      ),
    );
  }
}