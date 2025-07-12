import 'package:api_session/core/routes/app_routes.dart';
import 'package:api_session/core/services/prefs.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
