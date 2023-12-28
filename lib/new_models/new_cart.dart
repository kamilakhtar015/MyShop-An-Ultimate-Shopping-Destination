import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myshop/new_models/new_cart_item.dart';
import 'package:myshop/new_models/new_product.dart';

class Cart {
  List<CartItem> items = [];

  // Function to add a product to the cart
  void addToCart(NewProduct product) {
    // Check if the product is already in the cart
    var existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );

    if (existingItem.product.id == product.id) {
      // If the product is already in the cart, increase the quantity
      existingItem.quantity++;
    } else {
      // If the product is not in the cart, add a new cart item
      items.add(CartItem(product: product));
    }
  }

  // Function to remove a product from the cart
  void removeFromCart(NewProduct product) {
    items.removeWhere((item) => item.product.id == product.id);
  }

  // Function to calculate the total price of all items in the cart
  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.getTotalPrice();
    }
    return totalPrice;
  }

  // Convert the Cart object to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  // Create a Cart object from a Firestore document
  static Cart fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    List<CartItem> items = List<CartItem>.from(
      data['items'].map((item) => CartItem.fromDocumentSnapshot(item)),
    );
    return Cart()..items = items;
  }
}
