import 'package:api_session/core/errors/failure.dart';
import 'package:api_session/core/services/api_service.dart';
import 'package:api_session/features/products/data/repos/products_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/prefs.dart';
import '../models/product_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      late List<ProductModel> products = [];
      final result = await apiService.get(EndPoints.products);
      for (var product in result["data"]) {
        products.add(ProductModel.fromJson(product));
      }
      return Right(products);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToWishlist({
    required String id,
  }) async {
    try {
      await apiService.post(
        EndPoints.wishlist,
        data: {"productId": id},
        headers: {"token": "${Prefs.getString(kToken)}"},
      );
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    } catch (e) {
      return left((ServerFailure(errMessage: e.toString())));
    }
  }
}
