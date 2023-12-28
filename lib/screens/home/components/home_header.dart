import 'package:flutter/material.dart';
import 'package:myshop/screens/cart/cart_screen.dart';
import 'package:myshop/screens/home/components/iconbutton_counter.dart';
import 'package:myshop/screens/home/components/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(screenWidth: screenWidth, screenHeight: screenHeight),

          // the  button on the notification icon
          IconWithCounter(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfItems: 0,
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),

          // the  button on the notification icon
          // IconWithCounter(
          //   screenHeight: screenHeight,
          //   screenWidth: screenWidth,
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfItems: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
