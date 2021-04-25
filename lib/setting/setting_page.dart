import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/setting/setting_option.dart';
import 'package:qin_memo/theme_page.dart';

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeEnum theme = useProvider(themeProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Icon(Icons.close),
          ),
        ),
        title: const Text('設定'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'アカウント設定',
              style: TextStyle(fontSize: 14, color: Color(0xFFC2C6D2)),
            ),
            const SettingOption(text: '通知'),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).push<ThemePage>(
                  MaterialPageRoute<ThemePage>(builder: (BuildContext context) {
                    return ThemePage();
                  }),
                );
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'テーマ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            theme.getThemeText(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFC2C6D2),
                        ),
                      ],
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'サポート',
              style: TextStyle(fontSize: 14, color: Color(0xFFC2C6D2)),
            ),
            const SettingOption(text: 'プライバシーポリシー'),
            const SettingOption(text: '利用規約'),
            const SettingOption(text: 'オープンソースライセンス'),
            const SettingOption(text: 'お問い合わせ'),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'バージョン',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1.0.0',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'User ID',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'FIFIFIFIFIFI',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
