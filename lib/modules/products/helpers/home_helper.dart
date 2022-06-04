import 'package:dio/dio.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/slider_model.dart';

class HomeHelper {
  // these methods are used to get products from the response of home endpoint
  // I separated them to make the code more readable

  static List<Product> getSpareParts(Response response) => List.generate(
        response.data["data"]["latest_spar_part"].length,
        (index) => Product.fromJson(
          response.data["data"]["latest_spar_part"][index],
        ),
      );

  static List<Product> getLatestCars(Response response) => List.generate(
        response.data["data"]["latest_cars"].length,
        (index) =>
            Product.fromJson(response.data["data"]["latest_cars"][index]),
      );

  static List<Product> getWorkShopProducts(Response response) => List.generate(
        response.data["data"]["pro_more_arr"].length,
        (index) =>
            Product.fromJson(response.data["data"]["pro_more_arr"][index]),
      );

  static List<SliderModel> getHomeSliders(Response response) => List.generate(
        response.data["data"]["sliders"].length,
        (index) =>
            SliderModel.fromJson(response.data["data"]["sliders"][index]),
      );

  static List<CategoryModel> getHomeCategories(Response response) =>
      List.generate(
        response.data["data"]["cats"].length,
        (index) => CategoryModel.fromJson(response.data["data"]["cats"][index]),
      );
}
