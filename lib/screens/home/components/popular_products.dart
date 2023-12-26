import 'package:flutter/material.dart';
import 'package:myshop/components/product_card.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/home/components/section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          screenWidth: screenWidth,
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: screenHeight * 0.02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  screenWidth: screenWidth,
                  product: demoProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailsScreen.routerName,
                      arguments: ProductDetails(product: demoProducts[index])),
                ),
              ),
              SizedBox(width: screenHeight * 0.02)
            ],
          ),
        ),
      ],
    );
  }
}
