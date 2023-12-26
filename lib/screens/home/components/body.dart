import 'package:flutter/material.dart';
import 'package:myshop/screens/home/components/categories.dart';
import 'package:myshop/screens/home/components/discount_banner.dart';
import 'package:myshop/screens/home/components/home_header.dart';
import 'package:myshop/screens/home/components/popular_products.dart';
import 'package:myshop/screens/home/components/special_offer.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenWidth * 0.015),
          HomeHeader(screenWidth: screenWidth, screenHeight: screenHeight),
          SizedBox(height: screenWidth * 0.06),
          DiscountBanner(screenHeight: screenHeight, screenWidth: screenWidth),
          SizedBox(height: screenWidth * 0.06),
          const Categories(),
          SizedBox(height: screenWidth * 0.06),
          SpecialOffer(screenWidth: screenWidth),
          SizedBox(height: screenWidth * 0.06),
          PopularProducts(screenWidth: screenWidth, screenHeight: screenHeight),
          SizedBox(height: screenWidth * 0.06),
        ],
      ),
    );
  }
}
