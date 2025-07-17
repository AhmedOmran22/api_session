import 'package:api_session/core/utils/app_colors.dart';
import 'package:api_session/core/widgets/general_button.dart';
import 'package:api_session/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
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
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
