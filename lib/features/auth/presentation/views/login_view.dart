import 'package:api_session/core/utils/app_assets.dart';
import 'package:api_session/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/setup_service_locator.dart';
import '../../data/repos/auth_repo.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
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
                Image.asset(AppAssets.imagesUser, height: 200),
                const LoginForm(),

                const DontHaveAccount(
                  normalText: 'Don\'t have an account? ',
                  highlightedTextWithonTap: ' Sign Up',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
