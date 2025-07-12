import 'package:api_session/core/services/setup_service_locator.dart';
import 'package:api_session/features/auth/presentation/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';
import '../../data/repos/auth_repo.dart';
import '../widgets/create_account_form.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Image.asset(AppAssets.imagesUser, height: 150),
                const CreateAccountForm(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
