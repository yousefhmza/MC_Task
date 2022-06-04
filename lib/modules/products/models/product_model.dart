import '../../../core/utils/constants.dart';

class Product {
  final int id;
  final int merchantId;
  final int payed;
  final String title;
  final String catName;
  final int catId;
  final int price;
  final bool isFavourite;
  final String imgUrl;
  final List<String> images;

  Product({
    required this.id,
    required this.merchantId,
    required this.payed,
    required this.title,
    required this.catName,
    required this.catId,
    required this.price,
    required this.isFavourite,
    required this.imgUrl,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? Constants.zero,
        merchantId: json["merchant"] ?? Constants.zero,
        payed: json["payed"] ?? Constants.zero,
        title: json["title"] ?? Constants.empty,
        catName: json["cat"] ?? Constants.empty,
        catId: json["cat_id"] ?? Constants.zero,
        price: json["price"] ?? Constants.zero,
        isFavourite: json["favorite"] ?? false,
        imgUrl: json["image"] ?? Constants.empty,
        images: _getImages(json["imgs"] ?? Constants.emptyList),
      );

  static List<String> _getImages(List imageObjects) {
    final List<String> _images = [];
    for (var image in imageObjects) {
      _images.add(image["image"]);
    }
    return _images;
  }
}
