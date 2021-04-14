import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/search_history_model.dart';
import 'package:qin_memo/providers/get_search_histories_provider.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/providers/search_text_field_provider.dart';

class SearchHistoryList extends HookWidget {
  final AsyncValue<List<SearchHistory>> config =
      useProvider(getSearchHistoriesProvider('testuser'));
  final StateController<String> searchStateController =
      useProvider(searchStateProvider);
  final StateController<String> searchTextFieldController =
      useProvider(searchTextFieldProvider);

  @override
  Widget build(BuildContext context) {
    return config.when(
      loading: () => const Text('loading'),
      error: (_, __) => const Text('error'),
      data: (List<SearchHistory> searchHistories) {
        return Container(
          child: ListView.builder(
            itemCount: searchHistories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  searchTextFieldController.state =
                      searchHistories[index].keyword;
                  searchStateController.state = searchHistories[index].keyword;
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        searchHistories[index].keyword,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => print('hello'),
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFFC2C6D2),
                        ),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
