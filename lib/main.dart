import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/theme.dart';
import 'package:qin_memo/pages/walkthrough/walkthrough_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home_page.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider
            .overrideWithValue(await SharedPreferences.getInstance())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  final TextTheme appBarTextTheme = Typography.material2018().black;

  @override
  Widget build(BuildContext context) {
    final user = useProvider(userProvider.select((value) => value.user));
    final loading = useProvider(userProvider.select((value) => value.loading));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qin Memo',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: useProvider(themeProvider),
      home: loading
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : user == null
              ? WalkthroughPage()
              : HomePage(),
    );
  }
}
