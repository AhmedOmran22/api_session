import 'package:api_session/features/auth/data/repos/auth_repo.dart';
import 'package:api_session/features/auth/data/repos/auth_repo_impl.dart';
import 'package:api_session/features/checkout/data/repos/checkout_repo.dart';
import 'package:api_session/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:api_session/features/home/data/repos/products_repo.dart';
import 'package:api_session/features/home/data/repos/products_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';
import 'dio_consumer.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<CheckoutRepo>(
    CheckoutRepoImpl(apiService: getIt<ApiService>()),
  );
}
