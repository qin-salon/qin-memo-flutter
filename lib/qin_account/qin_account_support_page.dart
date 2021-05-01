import 'package:flutter/material.dart';
import 'package:qin_memo/setting/setting_option.dart';
import 'package:qin_memo/webview.dart';

class QinAccountSupportPage extends StatelessWidget {
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
        title: const Text('Qinアカウント'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('サポート',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SettingOption(text: 'プライバシーポリシー'),
                const SettingOption(text: '利用規約'),
                const SettingOption(text: 'オープンソースライセンス'),
                SettingOption(
                  text: 'お問い合わせ',
                  action: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<WebViewPage>(
                        builder: (BuildContext context) {
                          return const WebViewPage(
                            title: 'お問い合わせ',
                            url: 'https://forms.gle/pNNUdFnf3YmYpqhJ6',
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'バージョン',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1.0.0',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'User ID',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'FIFIFIFIFIFI',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                ),
              ],
            )
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
