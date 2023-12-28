import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/new_models/new_product.dart';
import 'package:myshop/screens/cart/cart_screen.dart';
import 'package:myshop/screens/details/components/product_description.dart';
import 'package:myshop/screens/details/components/product_images.dart';
// import 'package:myshop/screens/details/components/top_rounded_container.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.newproducts});

  final NewProduct newproducts;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // ProductImages(screenWidth: screenWidth, NewProduct: newproducts),
          ProductImages(
            screenWidth: screenWidth,
            newproducts: newproducts,
          ),
          // NewProduct: newproducts),
          // const SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(top: screenWidth * 0.03),
            padding: EdgeInsets.only(top: screenWidth * 0.03),
            width: double.infinity,
            height: screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ProductDescroption(
                //   product: product,
                //   screenWidth: screenWidth,
                //   pressOnMore: () {},
                // ),
                ProductDescroption(
                    newproducts: newproducts,
                    screenWidth: screenWidth,
                    pressOnMore: () {}),

                // Row(
                //   children: [
                //     ...List.generate(
                //       product.colors.length,
                //       (index) => ColorDot(
                //         screenWidth: screenWidth,
                //         color: product.colors[index],
                //       ),
                //     ),
                //     const Spacer(),
                //     RoundedIconBtn(press: () {}, iconData: Icons.remove),
                //     SizedBox(width: screenWidth * 0.1),
                //     RoundedIconBtn(press: () {}, iconData: Icons.add),
                //   ],
                // ),
                SizedBox(height: screenWidth * 0.06),
                DefaultButton(
                  text: 'Add to Cart',
                  press: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  width: 0,
                  height: 0,
                  // width: screenWidth * 0.18,
                  // height: screenWidth * 0.02,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.screenWidth,
    required this.color,
    this.isSelected = false,
  });

  final double screenWidth;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      width: screenWidth * 0.15,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: kPrimaryColor)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
