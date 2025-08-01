import 'package:balanced_meal/features/auth/login/login_screen.dart';
import 'package:balanced_meal/features/auth/register/register_screen.dart';
import 'package:balanced_meal/features/create_order/create_order_screen.dart';
import 'package:balanced_meal/features/order_summery/order_summery_screen.dart';
import 'package:balanced_meal/features/user_details/enter_user_details_screen.dart';
import 'package:balanced_meal/features/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'welcomeScreen': (context) => const WelcomeScreen(),
  'userDetailsScreen': (context) => const EnterUserDetailsScreen(),
  'createOrderScreen': (context) => CreateOrderScreen(),
  'orderSummeryScreen': (context) => OrderSummeryScreen(),
  'loginScreen': (context) => const LoginScreen(),
  'registerPage': (context) => const RegisterScreen(),

};
