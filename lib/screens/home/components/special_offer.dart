import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myshop/screens/home/components/section_title.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

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
          child: FutureBuilder(
            future: _getCategories(),
            builder:
                (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                List<Widget> categoryCards = [];
                for (var categoryData in snapshot.data!) {
                  categoryCards.add(SpecialOfferCard(
                    screenWidth: screenWidth,
                    image: categoryData['imgUrl'],
                    companyName: categoryData['companyName'],
                    numOfBrands: categoryData['numOfBrands'],
                    press: () {},
                  ));
                }

                return Row(
                  children: categoryCards,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> _getCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('categories').get();

    return querySnapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      return {
        'imgUrl': doc['imgUrl'],
        'companyName': doc['companyName'],
        'numOfBrands': doc['numOfBrands']
      };
    }).toList();
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.screenWidth,
    required this.companyName,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final double screenWidth;
  final String companyName, image;
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
              Image.network(
                image, // Load image from network
                width: double.infinity,
                height: double.infinity,
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
                      text: "$companyName\n",
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
