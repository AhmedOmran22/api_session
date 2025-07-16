import 'package:api_session/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:api_session/features/cart/presentation/widgets/cart_products_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_states.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is CartFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is GetCartSuccess) {
          if (state.cartProductModel.data!.products!.isEmpty) {
            return const Center(child: Text("Cart is empty"));
          }
          return CartProductsListViewBuilder(
            products: state.cartProductModel.data!.products!,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
// add prodcut to hive cart