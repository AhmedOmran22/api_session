import 'package:api_session/core/services/prefs.dart';
import 'package:api_session/core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit()..getCurrentTheme(),
      child: const ApiSession(),
    ),
  );
}

