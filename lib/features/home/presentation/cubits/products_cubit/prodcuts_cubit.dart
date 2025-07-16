import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/products_repo.dart';
import 'products_states.dart';

class ProdcutsCubit extends Cubit<ProductsStates> {
  ProdcutsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final failureOrProducts = await productsRepo.getProducts();
    failureOrProducts.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.errMessage)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
