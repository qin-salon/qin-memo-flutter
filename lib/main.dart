import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';

import 'home_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  // This widget is the root of your application.
  final TextTheme appBarTextTheme = Typography.material2018().black;

  @override
  Widget build(BuildContext context) {
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
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: この辺りふぁくたしたい
    final UserNotifier notifier = useProvider(userProvider.notifier);
    final ThemeNotifier themeNotifier = useProvider(themeProvider.notifier);
    final Future<void> _future =
        useMemoized(() => notifier.getUser('testuser'));
    final AsyncSnapshot<void> snapshot = useFuture(_future, initialData: null);
    final Future<void> _themeFuture =
        useMemoized(() => themeNotifier.getTheme());
    useFuture(_themeFuture, initialData: null);

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Text('loading');
    }
    if (snapshot.hasError) {
      return const Text('エラー');
    }
    return HomePage();
  }
}
