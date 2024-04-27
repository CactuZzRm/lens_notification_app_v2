import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(isDarkTheme: false));

  bool isDarkTheme = false;

  void changeTheme(BuildContext context) {
    isDarkTheme = !isDarkTheme;
    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
        ? AdaptiveTheme.of(context).setLight()
        : AdaptiveTheme.of(context).setDark();
    emit(ThemeInitial(isDarkTheme: isDarkTheme));
  }
}
