import '../../data/models/cart_product_model.dart';

abstract class CartStates {}

class CartInitial extends CartStates {}

class AddToCartSuccess extends CartStates {}

class CartLoading extends CartStates {}

class CartFailure extends CartStates {
  String errMessage;
  CartFailure({required this.errMessage});
}

class GetCartSuccess extends CartStates {
  CartProductModel cartProductModel;
  GetCartSuccess({required this.cartProductModel});
}

class ClearCartSuccess extends CartStates {}
