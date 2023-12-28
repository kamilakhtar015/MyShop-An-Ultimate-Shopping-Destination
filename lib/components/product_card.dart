import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/constants.dart';
// import 'package:myshop/models/product.dart';
import 'package:myshop/new_models/new_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.screenWidth,
    this.width = 0.04,
    this.aspectRatio = 1.02,
    required this.newproduct,
    required this.press,
  });

  final double screenWidth;
  final double width, aspectRatio;
  final NewProduct newproduct;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.06),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: screenWidth * 0.35,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  height: screenWidth * 0.4,
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(newproduct.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                newproduct.title,
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${newproduct.price}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.15,
                      decoration: const BoxDecoration(
                        // color: product.isFavourite
                        //     ? kPrimaryColor.withOpacity(0.15)
                        //     : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        // ignore: deprecated_member_use
                        // color: product.isFavourite
                        //     ? const Color(0xFFFF4848)
                        //     : const Color(0xFFDBDEE4),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
