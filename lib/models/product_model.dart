import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final double rating;
  final double price;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });

// Convert the Product object to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'images': images,
      'title': title,
      'description': description,
      'rating': rating,
      'price': price,
    };
  }

  // Create a Product object from a Firestore document
  static Product fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Product(
      id: data['id'],
      images: List<String>.from(data['images']),
      title: data['title'],
      description: data['description'],
      rating: data['rating'],
      price: data['price'],
    );
  }
}

class CartItem {
  final Product product;
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
      product: Product.fromDocumentSnapshot(data['product']),
      quantity: data['quantity'],
    );
  }
}

class Cart {
  List<CartItem> items = [];

  // Function to add a product to the cart
  void addToCart(Product product) {
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
  void removeFromCart(Product product) {
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
