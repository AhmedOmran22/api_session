import 'package:api_session/bottom_navigation_bar_view.dart';
import 'package:api_session/core/routes/app_routes.dart';
import 'package:api_session/features/auth/presentation/views/login_view.dart';
import 'package:api_session/features/settings/presentation/views/update_password_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/create_account_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/verfication_code_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case AppRoutes.createAnAccount:
      return MaterialPageRoute(builder: (_) => const CreateAccountView());

    case AppRoutes.bottomNavigationBar:
      return MaterialPageRoute(builder: (_) => const BottomNavigationBarView());
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

    case AppRoutes.verificationCode:
      return MaterialPageRoute(builder: (_) => const VerficationCodeView());

    case AppRoutes.resetPassword:
      return MaterialPageRoute(builder: (_) => const ResetPasswordView());

    case AppRoutes.changePassword:
      return MaterialPageRoute(builder: (_) => const ChangePasswordView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text("No route defined for ${settings.name}")),
        ),
      );
  }
}
