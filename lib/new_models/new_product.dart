import 'package:cloud_firestore/cloud_firestore.dart';

class NewProduct {
  final String productid;
  final List<String> images;
  final String title;
  final String description;
  final double rating;
  final double price;
  bool isFavourite;

  NewProduct({
    required this.productid,
    required this.images,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.isFavourite,
  });

// Convert the Product object to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'productid': productid,
      'images': images,
      'title': title,
      'description': description,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite
    };
  }

  // Create a Product object from a Firestore document
  static NewProduct fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return NewProduct(
      productid: data['productid'],
      images: List<String>.from(data['images']),
      title: data['title'],
      description: data['description'],
      rating: data['rating'],
      price: data['price'],
      isFavourite: data['isFavourite'],
    );
  }

  factory NewProduct.fromJson(Map<String, dynamic> json) {
    return NewProduct(
      productid: json['productid'],
      images: List<String>.from(json['images']),
      title: json['title'],
      description: json['description'],
      rating: json['rating'],
      price: json['price'],
      isFavourite: json['isFavourite'],
    );
  }

  toJson() {}
}
