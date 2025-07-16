import 'package:api_session/features/cart/data/models/cart_product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_divider.dart';

class CartProductsListViewBuilder extends StatelessWidget {
  const CartProductsListViewBuilder({super.key, required this.products});
  final List<CartProducts> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(products[index].sId!),
            Text(products[index].price.toString()),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
      itemCount: products.length,
    );
  }
}
