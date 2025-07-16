import 'package:api_session/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../data/models/product_model.dart';

class ProductsNameListViewBuilder extends StatelessWidget {
  const ProductsNameListViewBuilder({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            products[index].id!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          IconButton(
            onPressed: () {
              context.read<CartCubit>().addToCart(id: products[index].id!);
            },
            icon: const Icon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
      itemCount: products.length,
    );
  }
}
