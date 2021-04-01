import 'package:flutter/material.dart';

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
            ),
            ThemeOption(
              text: 'ライト',
            ),
            ThemeOption(
              text: 'ダーク',
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}

class ThemeOption extends StatelessWidget {
  const ThemeOption({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
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
