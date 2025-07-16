import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/repos/products_repo.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.productsRepo) : super(CartInitial());
  final ProductsRepo productsRepo;

  Future<void> addToCart({required String id}) async {
    final result = await productsRepo.addProductToCart(id: id);
    getCartProducts();
    result.fold(
      (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      (products) => emit(AddToCartSuccess()),
    );
  }

  Future<void> getCartProducts() async {
    emit(CartLoading());
    final result = await productsRepo.getCartProducts();
    result.fold(
      (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      (cartProductModel) =>
          emit(GetCartSuccess(cartProductModel: cartProductModel)),
    );
  }
}
