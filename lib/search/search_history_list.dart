import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/search_history_model.dart';
import 'package:qin_memo/normal_loading.dart';
import 'package:qin_memo/providers/search_histories_provider.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/providers/search_text_field_provider.dart';

class SearchHistoryListContainer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final loading = useProvider(
        searchHistoriesProvider('testuser').select((value) => value.loading));

    if (loading) {
      return NormalLoading();
    }

    return SearchHistoryList();
  }
}

class SearchHistoryList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final List<SearchHistory> searchHistories = useProvider(
        searchHistoriesProvider('testuser').select((value) => value.histories));
    final SearchHistoriesNotifier notifier =
        useProvider(searchHistoriesProvider('testuser').notifier);
    final StateController<String> searchStateController =
        useProvider(searchStateProvider);
    final StateController<String> searchTextFieldController =
        useProvider(searchTextFieldProvider);

    return Container(
      child: ListView.builder(
        itemCount: searchHistories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              searchTextFieldController.state = searchHistories[index].keyword;
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
                    onTap: () {
                      notifier.delete(
                          userId: 'testuser',
                          searchHistoryId: searchHistories[index].id);
                    },
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
  }
}
