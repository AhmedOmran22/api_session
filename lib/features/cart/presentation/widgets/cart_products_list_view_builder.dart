import 'package:api_session/features/cart/data/models/cart_product_model.dart';
import 'package:api_session/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

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
        return CartItem(
          cartProducts: cartProductModel.data!.products![index],
        );
      },
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
      itemCount: cartProductModel.data!.products!.length,
    );
  }
}
