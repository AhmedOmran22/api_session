import 'package:api_session/features/cart/data/models/cart_product_model.dart';
import 'package:api_session/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, void>> addProductToCart({required String id});
  Future<Either<Failure, CartProductModel>> getCartProducts();
  Future<Either<Failure, void>> clearCart();
  Future<Either<Failure, void>> deleteProductFromCart({
    required String id,
  });
}
