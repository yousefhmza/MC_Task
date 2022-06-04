import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/home_helper.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../models/slider_model.dart';
import '../../repositories/products_repository.dart';
import 'products_states.dart';

class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsViewModel() : super(ProductsInitialState());

  // set indicators

  int currentSliderIndex = 0;

  void setSliderIndex(int index) {
    currentSliderIndex = index;
    emit(SetSliderIndexState());
  }

  // get home page at start

  List<SliderModel> sliders = [];
  List<CategoryModel> categories = [];
  List<List<Product>> groupedHomeProducts = [];
  int selectedProductsListIndex = 0;

  Future<void> getHome() async {
    emit(GetHomeLoadingState());
    final result = await ProductsRepository.instance.getHome();
    result.fold(
      (failure) => emit(GetHomeFailureState(failure)),
      (response) {
        groupedHomeProducts = [
          HomeHelper.getSpareParts(response),
          HomeHelper.getLatestCars(response),
          HomeHelper.getWorkShopProducts(response),
        ];
        sliders = HomeHelper.getHomeSliders(response);
        categories = HomeHelper.getHomeCategories(response);
        emit(GetHomeSuccessState());
        toggleHomeProducts(0);
      },
    );
  }

  // toggle products in home screen
  void toggleHomeProducts(int index) {
    selectedProductsListIndex = index;
    emit(
      ToggleHomeProductsState(),
    );
  }

  // get product details
  Future<void> getProduct(int prodId) async {
    emit(GetProductLoadingState());
    final result = await ProductsRepository.instance.getProduct(prodId);
    result.fold(
      (failure) => emit(GetProductFailureState(failure)),
      (product) => emit(GetProductSuccessState(product)),
    );
  }

  // get category products
  Future<void> getCategoryProducts(int catId) async {
    emit(GetCatProductsLoadingState());
    final result = await ProductsRepository.instance.getCategoryProducts(catId);
    result.fold(
      (failure) => emit(GetCatProductsFailureState(failure)),
      (products) => emit(GetCatProductsSuccessState(products)),
    );
  }
}
