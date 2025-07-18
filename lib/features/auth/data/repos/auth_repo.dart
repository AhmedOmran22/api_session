import 'package:api_session/core/errors/failure.dart';
import 'package:api_session/features/auth/data/models/create_account_request_model.dart';
import 'package:api_session/features/auth/data/models/update_password_requset_model.dart';
import 'package:dartz/dartz.dart';

import '../models/login_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  });

  Future<Either<Failure, void>> login({
    required LoginRequestModel loginRequestModel,
  });
  Future<Either<Failure, void>> forgotPassword({required String email});
  Future<Either<Failure, void>> verfiyCode({required String code});
  Future<Either<Failure, void>> resetPassword({required String newPassword});
  Future<Either<Failure, void>> updatePassword({
    required UpdatePasswordRequsetModel updatePasswordRequsetModel,
  });
}
