abstract class CheckoutStates {}

class CheckoutInitial extends CheckoutStates {}

class CheckoutSuccess extends CheckoutStates {}

class CheckoutFailure extends CheckoutStates {
  final String errMessage;

  CheckoutFailure({required this.errMessage});
}

class CheckoutLoading extends CheckoutStates {}
