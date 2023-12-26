import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/constants.dart';

class IconWithCounter extends StatelessWidget {
  const IconWithCounter({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.svgSrc,
    required this.numOfItems,
    required this.press,
  });

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // Size of the ring and circle around it
            padding: EdgeInsets.all(screenHeight * 0.02),
            height: screenHeight * 0.075,
            width: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfItems != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: screenHeight * 0.04,
                width: screenWidth * 0.04,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: OverflowBox(
                    maxHeight: double.infinity,
                    maxWidth: double.infinity,
                    child: Text(
                      "$numOfItems",
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
