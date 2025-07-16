import 'package:api_session/features/home/presentation/cubits/products_cubit/prodcuts_cubit.dart';
import 'package:api_session/features/home/presentation/cubits/products_cubit/products_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_name_list_view_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdcutsCubit, ProductsStates>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsNameListViewBuilder(products: state.products);
        }
        if (state is ProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
