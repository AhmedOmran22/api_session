import 'package:api_session/features/home/data/models/product_model.dart';

abstract class ProductsStates {}

class ProductsInitial extends ProductsStates {}

class ProductsLoading extends ProductsStates {}

class ProductsSuccess extends ProductsStates {
  List<ProductModel> products;
  ProductsSuccess({required this.products});
}

class ProductsFailure extends ProductsStates {
  String errMessage;
  ProductsFailure({required this.errMessage});
}

