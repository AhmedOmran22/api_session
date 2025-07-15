import 'package:api_session/features/products/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, void>> addProductToWishlist({required String id});
}
