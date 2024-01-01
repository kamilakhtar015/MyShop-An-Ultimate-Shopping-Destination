import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/new_models/new_product.dart';

class ProductDescroption extends StatelessWidget {
  const ProductDescroption({
    super.key,
    required this.newproducts,
    required this.screenWidth,
    required this.pressOnMore,
  });

  final NewProduct newproducts;
  final double screenWidth;
  final GestureTapCallback pressOnMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newproducts.title,
            style: TextStyle(fontSize: screenWidth * 0.06),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: screenWidth * 0.04,
            ),
            child: Text(newproducts.description, maxLines: 3),
          ),
          GestureDetector(
            onTap: pressOnMore,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'See Details',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$${newproducts.price.toString()}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
