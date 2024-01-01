// ignore_for_file: avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/controllers/cart_price_controller.dart';
// import 'package:myshop/new_models/new_cart.dart';
import 'package:myshop/new_models/new_cart_item.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  static String routeName = "/cart";

  @override
  State<CheckOutScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CheckOutScreen> {
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
              "Check Out Screen",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      // body: const Body(),
      body: Container(
        child: Consumer(builder: (context, ref, child) {
          final cart = ref.watch(cartProvider).cartItems;
          return Column(
            children: cart.map((cartModel) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Image
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cartModel.images[0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Product details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartModel.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('\$${cartModel.price}'),
                              Text('Quantity: ${cartModel.productQuantity}'),
                              Text(
                                  'Total Price: \$${cartModel.productTotalPrice}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Text(e.productid.toString()),
                  // Text(e.productQuantity.toString()),
                ],
              );
            }).toList(),
          );
        }),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('cart')
      //       .doc(user!.uid)
      //       .collection('cartOrders')
      //       .snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return const Center(
      //         child: Text("Error"),
      //       );
      //     }

      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return SizedBox(
      //         height: screenWidth * 0.3,
      //         child: const Center(child: Text("No Products found!")),
      //       );
      //     }

      //     if (snapshot.data != null) {
      //       // return

      //       // Inside your StreamBuilder's ListView.builder
      //       return ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         shrinkWrap: true,
      //         physics: const BouncingScrollPhysics(),
      //         itemBuilder: (context, index) {
      //           final produtData = snapshot.data!.docs[index];
      //           CartModel cartModel = CartModel(
      //             productid: produtData['productid'],
      //             title: produtData['title'],
      //             price: produtData['price'],
      //             images: produtData['images'],
      //             productQuantity: produtData['productQuantity'],
      //             productTotalPrice: produtData['productTotalPrice'],
      //           );

      //           // To calculate the price of the items in the cart
      //           productPriceController.fetchProductPrice();

      //           return SwipeActionCell(
      //             key: ObjectKey(cartModel.productid),
      //             trailingActions: [
      //               SwipeAction(
      //                 title: "Delete",
      //                 forceAlignmentToBoundary: true,
      //                 performsFirstActionWithFullSwipe: true,
      //                 onTap: (CompletionHandler handler) {
      //                   print('Deleted');

      //                   FirebaseFirestore.instance
      //                       .collection('cart')
      //                       .doc(user!.uid)
      //                       .collection('cartOrders')
      //                       .doc(cartModel.productid)
      //                       .delete();
      //                 },
      //               )
      //             ],
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: [
      //                   // Image
      //                   Container(
      //                     width: 80,
      //                     height: 80,
      //                     decoration: BoxDecoration(
      //                       image: DecorationImage(
      //                         image: NetworkImage(cartModel.images[0]),
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.circular(10),
      //                     ),
      //                   ),
      //                   const SizedBox(width: 10),
      //                   // Product details
      //                   Expanded(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           cartModel.title,
      //                           style: const TextStyle(
      //                               fontSize: 16, fontWeight: FontWeight.bold),
      //                         ),
      //                         Text('\$${cartModel.price}'),
      //                         Text('Quantity: ${cartModel.productQuantity}'),
      //                         Text(
      //                             'Total Price: \$${cartModel.productTotalPrice}'),
      //                       ],
      //                     ),
      //                   ),
      //                   // Quantity buttons
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }

      //     // Default return when none of the conditions are met
      //     return const Center(
      //       child: Text("Unknown error occurred."),
      //     );
      //   },
      // ),

      // bottomNavigationBar: const CheckOurCard(),
      bottomNavigationBar: bottomNavBar(screenWidth),
    );
  }

  Container bottomNavBar(double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Text(
              " Total ${productPriceController.totalPrice.value.toStringAsFixed(1)} : USD",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              child: Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  child: const Text(
                    "Confirm Order",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showCustomBottomSheet();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showCustomBottomSheet() {
  Get.bottomSheet(Container(
    height: 500,
    decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  ));
}
