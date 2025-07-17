import 'package:api_session/features/home/presentation/widgets/product_id_item.dart';
import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';

class ProductsNameListViewBuilder extends StatelessWidget {
  const ProductsNameListViewBuilder({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          ProductIdItem(product: products[index]),
      itemCount: products.length,
    );
  }
}
