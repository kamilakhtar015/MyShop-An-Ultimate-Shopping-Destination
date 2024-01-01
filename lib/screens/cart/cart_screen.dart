// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:myshop/components/default_button.dart';
// import 'package:myshop/constants.dart';
import 'package:myshop/controllers/cart_price_controller.dart';
import 'package:myshop/new_models/new_cart.dart';
import 'package:myshop/new_models/new_cart_item.dart';
import 'package:myshop/screens/checkout/checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController =
      Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // final Cart newCart = Cart();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      // body: const Body(),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .collection('cartOrders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: screenWidth * 0.3,
              child: const Center(child: Text("No Products found!")),
            );
          }

          if (snapshot.data != null) {
            // return

            // Inside your StreamBuilder's ListView.builder
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final produtData = snapshot.data!.docs[index];
                CartModel cartModel = CartModel(
                  productid: produtData['productid'],
                  title: produtData['title'],
                  price: produtData['price'],
                  images: produtData['images'],
                  productQuantity: produtData['productQuantity'],
                  productTotalPrice: produtData['productTotalPrice'],
                );

                // To calculate the price of the items in the cart
                productPriceController.fetchProductPrice();

                return Consumer(builder: (context, ref, child) {
                  ref.read(cartProvider).addToCart(cartModel);
                  return SwipeActionCell(
                    key: ObjectKey(cartModel.productid),
                    trailingActions: [
                      SwipeAction(
                        title: "Delete",
                        forceAlignmentToBoundary: true,
                        performsFirstActionWithFullSwipe: true,
                        onTap: (CompletionHandler handler) {
                          print('Deleted');

                          FirebaseFirestore.instance
                              .collection('cart')
                              .doc(user!.uid)
                              .collection('cartOrders')
                              .doc(cartModel.productid)
                              .delete();
                        },
                      )
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // Image
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(cartModel.images[0]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Product details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartModel.title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Per Item:  \$${cartModel.price}'),
                                Text(
                                    'Total Price: \$${cartModel.productTotalPrice}')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_left),
                                  onPressed: () async {
                                    if (cartModel.productQuantity > 1) {
                                      await FirebaseFirestore.instance
                                          .collection('carts')
                                          .doc(user!.uid)
                                          .collection('cartOrders')
                                          .doc(cartModel.productid)
                                          .update({
                                        'productQuantity':
                                            cartModel.productQuantity - 1,
                                        'productTotalPrice': (cartModel.price) *
                                            (cartModel.productQuantity - 1),
                                      });
                                    }
                                  },
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text('${cartModel.productQuantity}'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_right),
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection('carts')
                                        .doc(user!.uid)
                                        .collection('cartOrders')
                                        .doc(cartModel.productid)
                                        .update({
                                      'productQuantity':
                                          cartModel.productQuantity + 1,
                                      'productTotalPrice': (cartModel.price) *
                                          (cartModel.productQuantity + 1),
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          }

          // Default return when none of the conditions are met
          return const Center(
            child: Text("Unknown error occurred."),
          );
        },
      ),

      // bottomNavigationBar: const CheckOurCard(),
      bottomNavigationBar: bottomNavBar(screenWidth),
    );
  }

  Container bottomNavBar(double screenWidth) {
    return Container(
      // color: Color.fromARGB(255, 233, 232, 230),
      height: screenWidth * 0.5,
      // width: screenWidth * 0.8,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * 0.08, 0, screenWidth * 0.08, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shadow line
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5), // Adjust opacity as needed
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20),

            Obx(
              () => Text(
                " Total \n\$${productPriceController.totalPrice.value.toStringAsFixed(1)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045),
              ),
            ),
            const SizedBox(height: 20),
            DefaultButton(
              height: 0.14,
              width: 1,
              press: () {},
              text: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
