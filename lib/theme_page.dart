import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';

class ThemePage extends StatelessWidget {
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
          children: const <Widget>[
            ThemeOption(
              text: 'OSの設定に合わせる',
              type: 'os',
            ),
            ThemeOption(
              text: 'ライト',
              type: 'light',
            ),
            ThemeOption(
              text: 'ダーク',
              type: 'dark',
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
  final String type;

  @override
  Widget build(BuildContext context) {
    final String theme = useProvider(themeProvider);
    return GestureDetector(
      onTap: () => print('theme'),
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
