import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../../data/models/product_model.dart';

class ProductIdItem extends StatelessWidget {
  const ProductIdItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(product.id.toString()),
        IconButton(
          onPressed: () {
            context.read<CartCubit>().addToCart(id: product.id!);
          },
          icon: const Icon(FontAwesomeIcons.plus),
        ),
      ],
    );
  }
}
