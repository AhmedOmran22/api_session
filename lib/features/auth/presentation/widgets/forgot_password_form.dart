import 'package:api_session/core/widgets/custom_text_form_field.dart';
import 'package:api_session/core/widgets/general_button.dart';
import 'package:api_session/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_regx.dart';
import '../../../../core/utils/show_snack_bar_funnction.dart';
import '../cubits/forgot_password_cubit/forgot_password_states.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
          CustomTextFormField(
            hitnText: "Email",
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            validator: (data) {
              if (data!.isEmpty) {
                return "email can't be empty";
              }
              if (!AppRegex.isEmailValid(data)) {
                return "email is not valid";
              }
              return null;
            },
          ),
          BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
            listener: (context, state) {
              if (state is ForgotPasswordFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is ForgotPasswordSuccess) {
                showSnackBarFuction(context, "check your email");
              }
            },
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
                return const CircularProgressIndicator();
              }
              return GeneralButton(
                onPressed: () => _handleForgotPassword(context),
                text: "forget password",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleForgotPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().forgotPassword(
        email: emailController.text,
      );
    }
  }
}
