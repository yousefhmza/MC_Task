class CartProduct {
  final String name;
  final String productID;
  final String image;
  final String price;
  int quantity;

  CartProduct({
    required this.productID,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory CartProduct.fromJson(Map<dynamic, dynamic> json) => CartProduct(
        productID: json["product_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() {
    return {
      "product_id": productID,
      "name": name,
      "image": image,
      "price": price,
      "quantity": quantity,
    };
  }
}
