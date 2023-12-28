import 'package:cloud_firestore/cloud_firestore.dart';

class NewProduct {
  final String id;
  final List<String> images;
  final String title;
  final String description;
  final double rating;
  final double price;

  NewProduct({
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
  static NewProduct fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return NewProduct(
      id: data['id'],
      images: List<String>.from(data['images']),
      title: data['title'],
      description: data['description'],
      rating: data['rating'],
      price: data['price'],
    );
  }

  factory NewProduct.fromJson(Map<String, dynamic> json) {
    return NewProduct(
      id: json['id'],
      images: List<String>.from(json['images']),
      title: json['title'],
      description: json['description'],
      rating: json['rating'],
      price: json['price'],
    );
  }
  
}
