import 'package:flutter/widgets.dart';
import 'package:myshop/screens/cart/cart_screen.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/favourite/favourite.dart';
import 'package:myshop/screens/forget_password/forget_password_screen.dart';
import 'package:myshop/screens/home/home_screen.dart';
import 'package:myshop/screens/login_success/login_success_screen.dart';
import 'package:myshop/screens/otp/otp_screen.dart';
import 'package:myshop/screens/profile/profile_screen.dart';
import 'package:myshop/screens/sign_in/sign_in_screen.dart';
import 'package:myshop/screens/sign_up/sign_up_screen.dart';
import 'package:myshop/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgetPasswordScreen.routneName: (context) => const ForgetPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routerName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  Profile.routeName: (context) => const Profile(),
  FavouriteScreen.routerName: (context) => const FavouriteScreen(),
};
