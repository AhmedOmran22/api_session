import 'package:api_session/features/auth/presentation/cubits/verficy_code_cubit/verify_code_cubit.dart';
import 'package:api_session/features/auth/presentation/widgets/verification_code_from.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/setup_service_locator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../data/repos/auth_repo.dart';

class VerficationCodeView extends StatelessWidget {
  const VerficationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCodeCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Column(
              spacing: 16,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Image.asset(AppAssets.imagesUser, height: 200),
                const VerficationCodeForm(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
