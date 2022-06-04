import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_database/cart_database.dart';
import '../../models/cart_product_model.dart';
import 'cart_states.dart';

class CartViewModel extends Cubit<CartStates> {
  CartViewModel() : super(CartInitialState());

  List<CartProduct> _cartProductsList = [];

  List<CartProduct> get cartProductsList => _cartProductsList;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  Future<void> addProduct(CartProduct cartProduct) async {
    emit(CartLoadingState());
    for (var product in _cartProductsList) {
      if (product.productID == cartProduct.productID) {
        return;
      }
    }
    await CartDatabaseHelper.instance.insertData(cartProduct);
    _cartProductsList.add(cartProduct);
    _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    emit(CartAddProductState());
  }

  Future<void> getProducts() async {
    emit(CartLoadingState());
    _cartProductsList = await CartDatabaseHelper.instance.getData();
    _getTotalPrice();
    emit(CartGetProductsState());
  }

  void _getTotalPrice() {
    for (var product in _cartProductsList) {
      _totalPrice += (double.parse(product.price) * product.quantity);
    }
  }

  Future<void> increaseQuantity(int index) async {
    emit(CartLoadingState());
    _cartProductsList[index].quantity++;
    _totalPrice += double.parse(_cartProductsList[index].price);
    await CartDatabaseHelper.instance.updateData(_cartProductsList[index]);
    emit(CartUpdateProductState());
  }

  Future<void> decreaseQuantity(int index) async {
    emit(CartLoadingState());
    if (_cartProductsList[index].quantity > 0) {
      _cartProductsList[index].quantity--;
      _totalPrice -= double.parse(_cartProductsList[index].price);
      await CartDatabaseHelper.instance.updateData(_cartProductsList[index]);
    }
    emit(CartUpdateProductState());
  }

  Future<void> deleteProduct(String id) async {
    emit(CartLoadingState());
    final CartProduct cartProduct =
        _cartProductsList.firstWhere((product) => product.productID == id);
    _cartProductsList
        .removeWhere((prod) => prod.productID == cartProduct.productID);
    _totalPrice -= (double.parse(cartProduct.price) * cartProduct.quantity);
    await CartDatabaseHelper.instance.deleteData(id);
    emit(CartDeleteProductState());
  }
}
