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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newproducts.title,
          // style: Theme.of(context).textTheme.headlineSmall,
          style: TextStyle(fontSize: screenWidth * 0.06),
        ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Container(
        //     padding: EdgeInsets.all(screenWidth * 0.04),
        //     width: screenWidth * 0.15,
        //     decoration: BoxDecoration(
        //       color: product.isFavourite
        //           ? const Color(0xFFFFE6E6)
        //           : const Color(0xFFF5F6F9),
        //       borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(20),
        //           bottomLeft: Radius.circular(20)),
        //     ),
        //     child: SvgPicture.asset(
        //       "assets/icons/Heart Icon_2.svg",
        //       // ignore: deprecated_member_use
        //       color: product.isFavourite
        //           ? const Color(0xFFFF4848)
        //           : const Color(0xFFDBDEE4),
        //     ),
        //   ),
        // ),
        // Align ends here
        Padding(
          padding: EdgeInsets.only(
            right: screenWidth * 0.04,
          ),
          child: Text(newproducts.description, maxLines: 3),
        ),

        GestureDetector(
          onTap: pressOnMore,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'See Details',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                // const SizedBox(width: 5),
                // const Icon(
                //   Icons.arrow_forward_ios,
                //   size: 12,
                //   color: kPrimaryColor,
                // ),
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
        ),
      ],
    );
  }
}
