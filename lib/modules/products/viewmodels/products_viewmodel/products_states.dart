import '../../../../core/services/error/failure.dart';
import '../../models/product_model.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class GetHomeLoadingState extends ProductsStates {}

class GetHomeSuccessState extends ProductsStates {}

class GetHomeFailureState extends ProductsStates {
  final Failure failure;

  GetHomeFailureState(this.failure);
}

class SetSliderIndexState extends ProductsStates {}

class ToggleHomeProductsState extends ProductsStates {}

class GetProductLoadingState extends ProductsStates {}

class GetProductSuccessState extends ProductsStates {
  final Product product;

  GetProductSuccessState(this.product);
}

class GetProductFailureState extends ProductsStates {
  final Failure failure;

  GetProductFailureState(this.failure);
}

class GetCatProductsLoadingState extends ProductsStates {}

class GetCatProductsSuccessState extends ProductsStates {
  final List<Product> products;

  GetCatProductsSuccessState(this.products);
}

class GetCatProductsFailureState extends ProductsStates {
  final Failure failure;

  GetCatProductsFailureState(this.failure);
}
