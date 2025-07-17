import 'package:api_session/core/errors/failure.dart';
import 'package:api_session/core/services/api_service.dart';
import 'package:api_session/features/checkout/data/models/checkout_model.dart';
import 'package:api_session/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/prefs.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final ApiService apiService;

  CheckoutRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> checkout({
    required CheckoutModel checkoutModel,
  }) async {
    try {
      await apiService.post(
        "${EndPoints.orders}/${Prefs.getString(kCartId)}",
        headers: {"token": "${Prefs.getString(kToken)}"},
        data: checkoutModel.toJson(),
      );
      return const Right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
