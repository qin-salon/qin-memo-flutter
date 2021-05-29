import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeEnum { OS, LIGHT, DARK }

extension ThemeExtension on ThemeEnum {
  static final Map<ThemeEnum, String> themeText = <ThemeEnum, String>{
    ThemeEnum.OS: 'ＯＳの設定に合わせる',
    ThemeEnum.LIGHT: 'ライト',
    ThemeEnum.DARK: 'ダーク'
  };

  static final Map<ThemeEnum, String> themeType = <ThemeEnum, String>{
    ThemeEnum.OS: 'os',
    ThemeEnum.LIGHT: 'light',
    ThemeEnum.DARK: 'dark'
  };

  String getThemeText() {
    return themeText[this] ?? 'ＯＳの設定に合わせる';
  }

  String getThemeType() {
    return themeType[this] ?? 'os';
  }
}

final StateNotifierProvider<ThemeNotifier, ThemeEnum> themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeEnum>((ProviderReference ref) =>
        ThemeNotifier(prefs: ref.watch(sharedPreferencesProvider)));

class ThemeNotifier extends StateNotifier<ThemeEnum> {
  ThemeNotifier({required this.prefs}) : super(ThemeEnum.OS) {
    () async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      state =
          _getThemeEnum(pref.getString('theme') ?? ThemeEnum.OS.getThemeType());
    }();
  }

  final SharedPreferences prefs;

  ThemeEnum _getThemeEnum(String value) {
    switch (value) {
      case 'os':
        return ThemeEnum.OS;
      case 'light':
        return ThemeEnum.LIGHT;
      case 'dark':
        return ThemeEnum.DARK;
      default:
        return ThemeEnum.OS;
    }
  }

  Future<void> setTheme(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('theme', value);
    state = _getThemeEnum(value);
  }
}
