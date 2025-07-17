import 'package:api_session/features/cart/data/models/cart_product_model.dart';
import 'package:api_session/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_divider.dart';

class CartProductsListViewBuilder extends StatelessWidget {
  const CartProductsListViewBuilder({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cartProductModel.data!.products![index].product!.id!),
            IconButton(
              onPressed: () {
                context.read<CartCubit>().deleteProductFromCart(
                  id: cartProductModel.data!.products![index].product!.id!,
                );
              },
              icon: const Icon(FontAwesomeIcons.trash),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
      itemCount: cartProductModel.data!.products!.length,
    );
  }
}
