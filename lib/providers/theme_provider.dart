import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themePrefsKey = 'selectedThemeKey';

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

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ProviderReference ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final index = prefs.getInt(_themePrefsKey) ?? ThemeMode.system.index;
  final themeMode = ThemeMode.values
      .firstWhere((e) => e.index == index, orElse: () => ThemeMode.system);
  return ThemeNotifier(
    prefs: ref.watch(sharedPreferencesProvider),
    initialThemeMode: themeMode,
  );
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier({required this.prefs, required ThemeMode initialThemeMode})
      : super(initialThemeMode);

  final SharedPreferences prefs;

  Future<void> setTheme(ThemeMode theme) async {
    await prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
