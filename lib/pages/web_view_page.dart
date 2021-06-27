import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qin_memo/widgets/spinner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends HookWidget {
  const WebViewPage({required this.title, required this.url});

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final loading = useState(true);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(children: <Widget>[
        WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            loading.value = false;
          },
        ),
        if (loading.value) Spinner(),
      ]),
    );
  }
}
