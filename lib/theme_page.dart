import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';

class ThemePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text('テーマ'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ThemeOption(
              text: ThemeMode.system.subtitle,
              type: ThemeMode.system,
            ),
            ThemeOption(
              text: ThemeMode.light.subtitle,
              type: ThemeMode.light,
            ),
            ThemeOption(
              text: ThemeMode.dark.subtitle,
              type: ThemeMode.dark,
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}

class ThemeOption extends HookWidget {
  const ThemeOption({required this.text, required this.type});

  final String text;
  final ThemeMode type;

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier notifier = useProvider(themeProvider.notifier);
    final ThemeMode theme = useProvider(themeProvider);

    return GestureDetector(
      onTap: () {
        notifier.setTheme(type);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (theme == type)
              const Icon(
                Icons.check,
                color: Color(0xFF3B82F6),
              )
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }
}
