import '../../../core/utils/constants.dart';

class SliderModel {
  final int id;
  final String title;
  final String text;
  final String link;
  final String imgUrl;

  SliderModel({
    required this.id,
    required this.title,
    required this.text,
    required this.link,
    required this.imgUrl,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"] ?? Constants.zero,
        title: json["title"] ?? Constants.empty,
        text: json["text"] ?? Constants.empty,
        link: json["link"] ?? Constants.empty,
        imgUrl: json["image"] ?? Constants.empty,
      );
}
