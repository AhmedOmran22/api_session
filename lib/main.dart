import 'package:api_session/core/services/prefs.dart';
import 'package:api_session/core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_session.dart';
import 'core/services/setup_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupServiceLocator();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit()..getCurrentTheme(),
      child: const ApiSession(),
    ),
  );
}

//? forget password
// 1 - send email to reset password (done)
// 2 - backend will send me a code (otp => one time password) (done)
// 3 - get the code from my gmail and send it to backend to know me (done)
// 4 - reset password with new password in case I forgot (done)
// 5 - update password (done)
