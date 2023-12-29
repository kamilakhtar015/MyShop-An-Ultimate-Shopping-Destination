// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/new_models/new_cart.dart';
import 'package:myshop/new_models/new_product.dart';
import 'package:myshop/screens/cart/cart_screen.dart';
import 'package:myshop/screens/details/components/product_description.dart';
import 'package:myshop/screens/details/components/product_images.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.newproducts});

  final NewProduct newproducts;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    User? user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ProductImages(
            screenWidth: screenWidth,
            newproducts: widget.newproducts,
          ),
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
                ProductDescroption(
                    newproducts: widget.newproducts,
                    screenWidth: screenWidth,
                    pressOnMore: () {}),
                SizedBox(height: screenWidth * 0.06),
                DefaultButton(
                  text: 'Add to Cart',
                  press: () async {
                    await checkProductExistence(uId: user!.uid);

                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  width: 0,
                  height: 0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Check product exists or not
  Future<void> checkProductExistence(
      {required String uId, int quantityIncrement = 1}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.newproducts.productid.toString());

    DocumentSnapshot snapshot = await documentReference.get();

// if product is in the cart
    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice = widget.newproducts.price * updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice,
      });

      print("Product exists");
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );

      CartModel cartModel = CartModel(
          productid: widget.newproducts.productid,
          title: widget.newproducts.title,
          price: widget.newproducts.price,
          images: widget.newproducts.images,
          // description: widget.newproducts.description,
          productQuantity: 1,
          productTotalPrice: widget.newproducts.price);

      await documentReference.set(cartModel.toMap());
      print("Product added");
    }
  }
}
