import 'package:api_session/core/utils/show_snack_bar_funnction.dart';
import 'package:api_session/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:api_session/features/cart/presentation/cubits/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/products_cubit/prodcuts_cubit.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  initState() {
    super.initState();
    context.read<ProdcutsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<CartCubit, CartStates>(
          listener: (context, state) {
            if (state is AddToCartSuccess) {
              showSnackBarFuction(context, "Added to cart successfully");
            }
            if (state is CartFailure) {
              showSnackBarFuction(context, state.errMessage);
            }
          },
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
