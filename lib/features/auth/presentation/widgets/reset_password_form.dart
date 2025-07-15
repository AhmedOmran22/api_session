import 'package:api_session/core/utils/show_snack_bar_funnction.dart';
import 'package:api_session/core/widgets/password_field.dart';
import 'package:api_session/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:api_session/features/auth/presentation/cubits/reset_password_cubit/reset_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/general_button.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late TextEditingController newPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          PasswordField(
            hintText: "new Password",
            controller: newPasswordController,
            textInputType: TextInputType.emailAddress,
          ),
          BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
            listener: (context, state) {
              if (state is ResetPasswordFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is ResetPasswordSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.bottomNavigationBar,
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              return GeneralButton(
                onPressed: () {
                  _hanldeVerfiyCode(context);
                },
                text: "Reset Password",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              );
            },
          ),
        ],
      ),
    );
  }

  void _hanldeVerfiyCode(BuildContext context) {
    context.read<ResetPasswordCubit>().resetPassword(
      newPassword: newPasswordController.text,
    );
  }
}
