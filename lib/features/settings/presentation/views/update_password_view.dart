import 'package:api_session/features/settings/presentation/cubits/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/setup_service_locator.dart';
import '../../../auth/data/repos/auth_repo.dart';
import '../widgets/update_user_data_form.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(getIt<AuthRepo>()),
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
                const UpdatePasswordForm(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
