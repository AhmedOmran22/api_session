import 'package:api_session/core/themes/dark_theme.dart';
import 'package:api_session/core/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants.dart';
import '../services/prefs.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  void getCurrentTheme() {
    bool isDark = Prefs.getBool(kIsDarkMode);
    if (isDark) {
      emit(darkTheme);
    } else {
      emit(lightTheme);
    }
  }

  void toggleTheme() {
    Prefs.setBool(kIsDarkMode, !Prefs.getBool(kIsDarkMode));
    getCurrentTheme();
  }
}
