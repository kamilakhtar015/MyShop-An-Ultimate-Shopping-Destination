import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myshop/components/product_card.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/home/components/all_products.dart';
import 'package:myshop/screens/home/components/section_title.dart';
import 'package:myshop/new_models/new_product.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          screenWidth: screenWidth,
          text: "Popular Product",
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AllProducts()));
          },
        ),
        SizedBox(height: screenHeight * 0.02),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Products').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            List<NewProduct> newproducts = snapshot.data!.docs
                .map((DocumentSnapshot doc) {
                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  return NewProduct.fromJson(data);
                })
                .where((p) => p.rating > 4.2)
                .toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    newproducts.length,
                    (index) => ProductCard(
                      screenWidth: screenWidth,
                      newproduct: newproducts[index],
                      press: () {
                        Navigator.pushNamed(context, DetailsScreen.routerName,
                            arguments: ProductDetails(
                                newproducts: newproducts[index]));
                      },
                    ),
                  ),
                  SizedBox(width: screenHeight * 0.02)
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
