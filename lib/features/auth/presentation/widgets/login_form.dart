import 'package:api_session/core/utils/app_colors.dart';
import 'package:api_session/core/widgets/custom_text_form_field.dart';
import 'package:api_session/core/widgets/general_button.dart';
import 'package:api_session/core/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_regx.dart';
import '../../../../core/utils/show_snack_bar_funnction.dart';
import '../../data/models/login_request_model.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_states.dart';
import 'forgot_password_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController, passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            controller: emailController,
            hintText: "Email",
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
          PasswordField(
            controller: passwordController,
            hintText: "Password",
          ),
          const ForgotPasswordText(),
          BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              if (state is LoginFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is LoginSuccess) {
                //  todo : navigate to home
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              return GeneralButton(
                text: "Login",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  _handleLoginRequest(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleLoginRequest(BuildContext context) {
    if (formKey.currentState!.validate()) {
      LoginRequestModel loginRequestModel = LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      );
      context.read<LoginCubit>().Login(
        loginRequestModel: loginRequestModel,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
