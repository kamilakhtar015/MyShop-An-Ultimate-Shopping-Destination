class CartModel {
  final String productid;
  final String title;
  final double price;
  final List images;
  // final String description;
  final double productQuantity;
  final double productTotalPrice;

  CartModel({
    required this.productid,
    required this.title,
    required this.price,
    required this.images,
    // required this.description,
    required this.productQuantity,
    required this.productTotalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'productid': productid,
      'title': title,
      'price': price,
      'images': images,
      //  'description': description,
      'productQuantity': productQuantity,
      'productTotalPrice': productTotalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> json) {
    return CartModel(
      productid: json['productid'],
      title: json['title'],
      price: json['price'],
      images: json['images'],
      // description: json['description'],
      productQuantity: json['productQuantity'],
      productTotalPrice: json['productTotalPrice'],
    );
  }
}
