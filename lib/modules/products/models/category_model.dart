import '../../../core/utils/constants.dart';

class CategoryModel {
  final int id;
  final String title;
  final String imgUrl;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imgUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] ?? Constants.zero,
        title: json["title"] ?? Constants.empty,
        imgUrl: json["image"] ?? Constants.empty,
      );
}
