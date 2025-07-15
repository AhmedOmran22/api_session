import 'package:api_session/core/constants/end_points.dart';
import 'package:api_session/core/errors/failure.dart';
import 'package:api_session/core/services/prefs.dart';
import 'package:api_session/features/auth/data/models/create_account_request_model.dart';
import 'package:api_session/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/api_service.dart';
import '../models/login_request_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  }) async {
    try {
      await apiService.post(
        EndPoints.register,
        data: createAccountRequestModel.toJson(),
      );
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final result = await apiService.post(
        EndPoints.login,
        data: loginRequestModel.toJson(),
      );
      final String token = result['token'];
      Prefs.setString(kToken, token);
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  }) async {
    try {
      await apiService.post(
        EndPoints.forgotPassword,
        data: {"email": "$email"},
      );
      Prefs.setString(kForgottenEmail, email);
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> verfiyCode({required String code}) async {
    try {
      await apiService.post(
        EndPoints.verifyCode,
        data: {"resetCode": "$code"},
      );
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  }) async {
    try {
      final result = await apiService.put(
        EndPoints.resetPassword,
        data: {
          "newPassword": "$newPassword",
          "email": Prefs.getString(kForgottenEmail),
        },
      );
      final String token = result['token'];
      Prefs.setString(kToken, token);
      Prefs.removeData(key: kForgottenEmail);
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }
}
