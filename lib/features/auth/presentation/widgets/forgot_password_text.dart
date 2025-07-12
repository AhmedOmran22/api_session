import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.forgotPassword);
        },
        child: Text(
          "forget Password?",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
