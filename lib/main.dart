import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

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
  // This widget is the root of your application.
  final TextTheme appBarTextTheme = Typography.material2018().black;

  @override
  Widget build(BuildContext context) {
    final themeMode = useProvider(themeProvider);
    print(themeMode.subtitle);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qin Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            textTheme: appBarTextTheme.copyWith(
                headline6: appBarTextTheme.headline6!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold))),
      ),
      home: HomePage(),
    );
  }
}
