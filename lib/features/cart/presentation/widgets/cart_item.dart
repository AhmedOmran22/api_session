import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/models/cart_product_model.dart';
import '../cubits/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartProducts});

  final CartProducts cartProducts;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(cartProducts.product!.id.toString()),
        IconButton(
          onPressed: () {
            context.read<CartCubit>().deleteProductFromCart(
              id: cartProducts.product!.sId!,
            );
          },
          icon: const Icon(FontAwesomeIcons.trash),
        ),
      ],
    );
  }
}
