import 'package:api_session/core/routes/app_routes.dart';
import 'package:api_session/core/services/prefs.dart';
import 'package:api_session/features/products/data/repos/products_repo_impl.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/setup_service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ProductsRepoImpl(apiService: getIt<ApiService>()).getProducts();
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Prefs.removeData(key: kToken);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout_sharp),
          ),
        ],
      ),

      body: const Center(child: Text('Home View')),
    );
  }
}
