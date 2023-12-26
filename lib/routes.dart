import 'package:flutter/widgets.dart';
import 'package:myshop/screens/cart/cart_screen.dart';
import 'package:myshop/screens/complete_profile/complete_profile.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/forget_password/forget_password_screen.dart';
import 'package:myshop/screens/home/home_screen.dart';
import 'package:myshop/screens/login_success/login_success_screen.dart';
import 'package:myshop/screens/otp/otp_screen.dart';
import 'package:myshop/screens/sign_in/sign_in_screen.dart';
import 'package:myshop/screens/sign_up/sign_up_screen.dart';
import 'package:myshop/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreeen.routeName: (context) => const SplashScreeen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgetPasswordScreen.routneName: (context) => const ForgetPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routerName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
};
