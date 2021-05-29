import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension ThemeModeExt on ThemeMode {
  String get subtitle {
    switch (this) {
      case ThemeMode.system:
        return 'ＯＳの設定に合わせる';
      case ThemeMode.light:
        return 'ライト';
      case ThemeMode.dark:
        return 'ダーク';
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
    (ProviderReference ref) =>
        ThemeNotifier(prefs: ref.watch(sharedPreferencesProvider)));

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier({required this.prefs}) : super(ThemeMode.system) {
    () async {
      state = _getThemeMode(
          prefs.getString('theme') ?? ThemeMode.system.toString());
    }();
  }

  final SharedPreferences prefs;

  ThemeMode _getThemeMode(String value) {
    switch (value) {
      case 'os':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeMode value) async {
    await prefs.setString('theme', value.toString());
    state = value;
  }
}
