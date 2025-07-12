import 'package:api_session/core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme_cubit/theme_cubit_state.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'features/auth/presentation/views/login_view.dart';

class ApiSession extends StatelessWidget {
  const ApiSession({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state is LightThemeState
              ? lightTheme
              : darkTheme,
          home: const LoginView(),
        );
      },
    );
  }
}
