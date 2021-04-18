import 'package:flutter/material.dart';

class WalkthroughPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('シンプルなメモ'),
          const Text('見出しも画像も使えません\nだからこそ書くことに集中できます'),
        ],
      ),
    );
  }
}
