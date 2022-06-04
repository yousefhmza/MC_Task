import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/services/error/error_handler.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/connection_manager.dart';
import '../../../core/services/network/dio_factory.dart';
import '../../../core/services/network/end_points.dart';
import '../models/product_model.dart';

class ProductsRepository {
  ProductsRepository._();

  static final ProductsRepository instance = ProductsRepository._();

  Future<Either<Failure, Response>> getHome() async {
    final bool isConnected = await NetworkConnectionManger.checkConnection();
    if (isConnected) {
      try {
        final response = await DioFactory.get(url: EndPoints.getHome);
        if (response.data["success"] == true) {
          return Right(response);
        } else {
          return Left(
            Failure(
              response.data["code"] ?? 400,
              response.data["message"] ?? ResponseMessage.unKnown,
            ),
          );
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(ErrorType.noInternetConnection.getFailure());
    }
  }

  Future<Either<Failure, Product>> getProduct(int prodId) async {
    final bool isConnected = await NetworkConnectionManger.checkConnection();
    if (isConnected) {
      try {
        final response =
            await DioFactory.get(url: EndPoints.getProduct(prodId));
        if (response.data["success"] == true) {
          return Right(Product.fromJson(response.data["data"]));
        } else {
          return Left(
            Failure(
              response.data["code"] ?? 400,
              response.data["message"] ?? ResponseMessage.unKnown,
            ),
          );
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(ErrorType.noInternetConnection.getFailure());
    }
  }

  Future<Either<Failure, List<Product>>> getCategoryProducts(
      int catProd) async {
    final bool isConnected = await NetworkConnectionManger.checkConnection();
    if (isConnected) {
      try {
        final response =
            await DioFactory.get(url: EndPoints.getCategoryProducts(catProd));
        if (response.data["success"] == true) {
          final List<Product> _products = [];
          for (var product in response.data["data"]) {
            _products.add(Product.fromJson(product));
          }
          return Right(_products);
        } else {
          return Left(
            Failure(
              response.data["code"] ?? 400,
              response.data["message"] ?? ResponseMessage.unKnown,
            ),
          );
        }
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(ErrorType.noInternetConnection.getFailure());
    }
  }
}
