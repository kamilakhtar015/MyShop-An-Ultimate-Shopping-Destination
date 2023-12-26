import 'package:flutter/material.dart';
import 'package:myshop/screens/home/components/section_title.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          screenWidth: screenWidth,
          text: 'Special for you',
          press: () {},
        ),
        SizedBox(height: screenWidth * 0.02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                screenWidth: screenWidth,
                image: 'assets/images/Image Banner 2.png',
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                screenWidth: screenWidth,
                image: 'assets/images/Image Banner 3.png',
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: screenWidth * 0.02),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.screenWidth,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final double screenWidth;

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: SizedBox(
        width: screenWidth * 0.6,
        height: screenWidth * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF343434).withOpacity(0.4),
                      const Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenWidth * 0.02,
                ),
                child: Text.rich(TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "$category\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "$numOfBrands Brands"),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
