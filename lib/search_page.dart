import 'package:flutter/material.dart';
import 'package:qin_memo/search_app_bar_title.dart';
import 'package:qin_memo/search_history_list.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: SearchAppBarTitle(),
      ),
      body: SearchHistoryList(),
    );
  }
}
