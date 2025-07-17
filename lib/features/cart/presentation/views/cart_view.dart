import 'package:api_session/core/services/setup_service_locator.dart';
import 'package:api_session/core/utils/app_colors.dart';
import 'package:api_session/core/widgets/general_button.dart';
import 'package:api_session/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:api_session/features/checkout/data/repos/checkout_repo.dart';
import 'package:api_session/features/checkout/presentation/cubits/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../checkout/data/models/checkout_model.dart';
import '../cubits/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(getIt<CheckoutRepo>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 16,
                children: [
                  const Expanded(child: CartViewBody()),
                  GeneralButton(
                    onPressed: () {
                      context.read<CartCubit>().clearCart();
                    },
                    text: "clear cart",
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
                  GeneralButton(
                    text: "check out",
                    onPressed: () {
                      context.read<CheckoutCubit>().checkout(
                        checkoutModel: CheckoutModel(
                          details: 'Details',
                          phone: '01229804760',
                          city: 'Alexandria',
                        ),
                      );
                    },
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
