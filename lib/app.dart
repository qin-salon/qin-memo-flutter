import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/pages/home_page.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/pages/walkthrough/walkthrough_page.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final user = useProvider(userProvider.select((value) => value.user));
    final loading = useProvider(userProvider.select((value) => value.loading));

    const _spinner = Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qin Memo',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: useProvider(themeProvider),
      home: loading
          ? _spinner
          : user == null
              ? WalkthroughPage()
              : HomePage(),
    );
  }
}
