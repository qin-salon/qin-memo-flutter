import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_list.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/search_app_bar_title.dart';
import 'package:qin_memo/search_history_list.dart';

class SearchPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSearch = useProvider(searchStateProvider).state;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: SearchAppBarTitle(),
      ),
      body: Container(
        child: isSearch ? NoteList() : SearchHistoryList(),
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      ),
    );
  }
}
