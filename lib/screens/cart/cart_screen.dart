import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:myshop/models/cart.dart';
import 'package:myshop/new_models/new_cart.dart';
import 'package:myshop/new_models/new_cart_item.dart';
import 'package:myshop/screens/cart/components/body.dart';
import 'package:myshop/screens/cart/components/check_our_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final Cart newCart = Cart();
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
              style: TextStyle(color: Colors.black),
            ),
            // Text(
            //   // "${demoCarts.length} items",
            //   style: Theme.of(context).textTheme.bodySmall,
            // ),
          ],
        ),
      ),
      // body: const Body(),

      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .collection('cartOrders')
            .get(),
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
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                // Customize this part based on your data structure
                // var cartItem = snapshot.data!.docs[index];
                final produtData = snapshot.data!.docs[index];
                CartModel cartModel = CartModel(
                    productid: produtData['productid'],
                    title: produtData['title'],
                    price: produtData['price'],
                    images: produtData['images'],
                    productQuantity: produtData['productQuantity'],
                    productTotalPrice: produtData['productTotalPrice']);

                // Adding to cart class
                // newCart.addToCart(cartModel);
                // context.read(cartProvider);
                return CartItem(product: cartModel);
              },
            );
          }

          // Default return when none of the conditions are met
          return const Center(
            child: Text("Unknown error occurred."),
          );
        },
      ),

      bottomNavigationBar: const CheckOurCard(),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartModel product;

  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.images[0]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('\$${product.price}'),
                Text('Quantity: ${product.productQuantity}'),
                Text('Total Price: \$${product.productTotalPrice}'),
              ],
            ),
          ),
          // Quantity buttons
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Implement logic to increase quantity
                },
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  // Implement logic to decrease quantity
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
