import 'package:api_session/core/widgets/custom_text_form_field.dart';
import 'package:api_session/core/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController, passwordController;

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
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          CustomTextFormField(
            controller: emailController,
            hitnText: "Email",
          ),
          PasswordField(
            controller: passwordController,
            hintText: "Password",
          ),
        ],
      ),
    );
  }
}
