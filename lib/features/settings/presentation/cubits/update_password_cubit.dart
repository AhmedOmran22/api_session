import 'package:api_session/features/auth/data/models/update_password_requset_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/repos/auth_repo.dart';
import 'update_password_states.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordStates> {
  UpdatePasswordCubit(this._authRepo) : super(UpdatePasswordInitial());

  final AuthRepo _authRepo;

  void updatePassword({
    required UpdatePasswordRequsetModel updatePasswordRequsetModel,
  }) async {
    emit(UpdatePasswordLoading());
    final result = await _authRepo.updatePassword(
      updatePasswordRequsetModel: updatePasswordRequsetModel,
    );
    result.fold((failure) {
      emit(UpdatePasswordFailure(errMessage: failure.errMessage));
    }, (r) => emit(UpdatePasswordSuccess()));
  }
}
