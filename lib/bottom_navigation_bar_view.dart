import 'package:api_session/custom_bottom_navigation_bar.dart';
import 'package:api_session/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:api_session/features/home/presentation/views/home_view.dart';
import 'package:api_session/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/cart/presentation/views/cart_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState
    extends State<BottomNavigationBarView> {
  int currentIndex = 0;
  @override
  initState() {
    context.read<CartCubit>().getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: currentIndex == 0,
        onPopInvokedWithResult: (didPop, result) {
          {
            setState(() {
              currentIndex = 0;
            });
          }
        },
        child: IndexedStack(
          index: currentIndex,
          children: const [
            HomeView(),
            SizedBox(),
            CartView(),
            SettingsView(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
