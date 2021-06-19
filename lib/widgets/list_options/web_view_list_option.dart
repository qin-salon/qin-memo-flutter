import 'package:flutter/material.dart';
import 'package:qin_memo/pages/web_view_page.dart';
import 'package:qin_memo/widgets/list_options/list_option.dart';

class WebViewListOption extends StatelessWidget {
  const WebViewListOption({Key? key, required this.text, required this.url})
      : super(key: key);

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ListOption(
      text: text,
      action: () {
        Navigator.of(context).push(
          MaterialPageRoute<WebViewPage>(
            builder: (BuildContext context) {
              return WebViewPage(
                title: text,
                url: url,
              );
            },
          ),
        );
      },
    );
  }
}
