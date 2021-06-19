import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/widgets/list_options/list_option.dart';
import 'package:qin_memo/widgets/list_options/version_list_option.dart';
import 'package:qin_memo/widgets/list_options/web_view_list_option.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/pages/settings/theme_page.dart';

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useProvider(themeProvider);
    final userId = useProvider(userProvider.select((value) => value.user?.id));

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
            Text(
              'アカウント設定',
              style: Theme.of(context).textTheme.subtitle2,
            ),
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
                    Text(
                      'テーマ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            theme.subtitle,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'サポート',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const WebViewListOption(
                text: 'プライバシーポリシー', url: 'https://memo.qin.sh/'),
            const WebViewListOption(text: '利用規約', url: 'https://memo.qin.sh/'),
            ListOption(
                text: 'オープンソースライセンス',
                action: () => showLicensePage(context: context)),
            const WebViewListOption(
                text: 'お問い合わせ', url: 'https://forms.gle/pNNUdFnf3YmYpqhJ6'),
            const VersionListOption()
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
