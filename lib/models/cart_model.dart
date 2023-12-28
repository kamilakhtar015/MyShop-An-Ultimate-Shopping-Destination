import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/models/product.dart';

class CartModel {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
  }

  bool isInCart(Product product) {
    return _cartItems.contains(product);
  }
}

final cartProvider = Provider<CartModel>((ref) {
  return CartModel();
});
