import 'package:api_session/features/checkout/data/models/checkout_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> checkout({
    required CheckoutModel checkoutModel,
  });
}
