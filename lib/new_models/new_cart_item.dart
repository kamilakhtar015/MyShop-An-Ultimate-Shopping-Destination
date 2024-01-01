import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/new_models/new_cart.dart';

class Cart {
  List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;

  void addToCart(CartModel product) {
    // Check if the product already exists in the cart
    bool productExists =
        _cartItems.any((item) => item.productid == product.productid);

    if (!productExists) {
      _cartItems.add(product);
    }
  }

  void removeFromCart(CartModel product) {
    _cartItems.remove(product);
  }

  bool isInCart(CartModel product) {
    return _cartItems.contains(product);
  }
}

final cartProvider = Provider<Cart>((ref) {
  return Cart();
});
