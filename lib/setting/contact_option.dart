import 'package:flutter/material.dart';
import 'package:qin_memo/setting/setting_option.dart';
import 'package:qin_memo/webview.dart';

class ContactOption extends StatelessWidget {
  const ContactOption();

  @override
  Widget build(BuildContext context) {
    return SettingOption(
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
    );
  }
}
