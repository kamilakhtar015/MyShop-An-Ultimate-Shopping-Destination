import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myshop/new_models/new_product.dart';

class CartItem {
  final NewProduct product;
  int quantity; // Quantity of the product in the cart

  CartItem({
    required this.product,
    this.quantity = 1, // Default quantity is 1
  });

  // Function to calculate the total price of the cart item
  double getTotalPrice() {
    return product.price * quantity;
  }

  // Convert the CartItem object to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  // Create a CartItem object from a Firestore document
  static CartItem fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return CartItem(
      product: NewProduct.fromDocumentSnapshot(data['product']),
      quantity: data['quantity'],
    );
  }
}
