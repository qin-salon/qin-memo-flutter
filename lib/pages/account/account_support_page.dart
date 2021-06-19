import 'package:flutter/material.dart';
import 'package:qin_memo/widgets/list_options/version_list_option.dart';
import 'package:qin_memo/widgets/list_options/web_view_list_option.dart';

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
              children: const <Widget>[
                WebViewListOption(
                    text: 'プライバシーポリシー', url: 'https://memo.qin.sh/'),
                WebViewListOption(text: '利用規約', url: 'https://memo.qin.sh/'),
                WebViewListOption(
                    text: 'お問い合わせ', url: 'https://forms.gle/pNNUdFnf3YmYpqhJ6'),
                VersionListOption(),
              ],
            )
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
