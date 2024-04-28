import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../storage/shared_preferences.dart';
import 'app_theme.dart';

final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final themeMode = NotifierProvider<ThemeModeNotifier, ThemeMode>((){
    return ThemeModeNotifier();
  },
);

final _theme = AppTheme.lightTheme;
final _darkTheme = AppTheme.darkTheme;

class ThemeModeNotifier extends Notifier<ThemeMode> {
  late SharedPreferences sharedPref;

  @override
  ThemeMode build() {
    sharedPref = ref.read(sharedPreferencesProvider);
    return ThemeMode.values.firstWhere(
            (element) => element.toString() == sharedPref.getString("THEME_MODE"), orElse: () => ThemeMode.light);
  }

  void toggle() {
    if (state == ThemeMode.dark) {
      _persistThemeMode(ThemeMode.light);
      state = ThemeMode.light;
    } else {
      _persistThemeMode(ThemeMode.dark);
      state = ThemeMode.dark;
    }
  }

  bool isDark(){
    return state == ThemeMode.dark;
  }

  _persistThemeMode(ThemeMode mode) => sharedPref.setString("THEME_MODE", mode.toString());

}
