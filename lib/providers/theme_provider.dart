import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateNotifierProvider<ThemeNotifier, String> themeProvider =
    StateNotifierProvider<ThemeNotifier, String>(
        (ProviderReference ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<String> {
  ThemeNotifier() : super('os');
}
