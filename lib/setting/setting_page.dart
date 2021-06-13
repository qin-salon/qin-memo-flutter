import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/setting/contact_option.dart';
import 'package:qin_memo/setting/open_source_license_option.dart';
import 'package:qin_memo/setting/privacy_policy_option.dart';
import 'package:qin_memo/setting/terms_option.dart';
import 'package:qin_memo/setting/user_id_option.dart';
import 'package:qin_memo/setting/version_option.dart';
import 'package:qin_memo/theme_page.dart';

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useProvider(themeProvider);

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
              style: Theme.of(context).textTheme.subtitle1,
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
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const PrivacyPolicyOption(),
            const TermsOption(),
            const OpenSourceLicenseOption(),
            const ContactOption(),
            const VersionOption(),
            const UserIdOption(),
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
