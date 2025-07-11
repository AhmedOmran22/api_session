import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants.dart';
import '../services/prefs.dart';
import 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitInitial());

  void getCurrentTheme() {
    bool isDark = Prefs.getBool(kIsDarkMode);
    if (isDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  void toggleTheme() {
    Prefs.setBool(kIsDarkMode, !Prefs.getBool(kIsDarkMode));
    getCurrentTheme();
  }
}
