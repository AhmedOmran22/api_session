import 'package:api_session/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/checkout_model.dart';
import 'checkout_cubit_states.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;
  Future<void> checkout({
    required CheckoutModel checkoutModel,
  }) async {
    emit(CheckoutLoading());
    final result = await checkoutRepo.checkout(
      checkoutModel: checkoutModel,
    );
    result.fold(
      (failure) => emit(CheckoutFailure(errMessage: failure.errMessage)),
      (cartProductModel) => emit(CheckoutSuccess()),
    );
  }
}
