abstract class UpdatePasswordStates {}

class UpdatePasswordInitial extends UpdatePasswordStates {}

class UpdatePasswordLoading extends UpdatePasswordStates {}

class UpdatePasswordSuccess extends UpdatePasswordStates {}

class UpdatePasswordFailure extends UpdatePasswordStates 
{
  final String errMessage;
  UpdatePasswordFailure({required this.errMessage});
}