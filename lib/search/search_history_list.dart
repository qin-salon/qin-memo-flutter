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
    final loading =
        useProvider(searchHistoriesProvider.select((value) => value.loading));

    if (loading) {
      return NormalLoading();
    }

    return SearchHistoryList();
  }
}

class SearchHistoryList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final List<SearchHistory> searchHistories =
        useProvider(searchHistoriesProvider.select((value) => value.histories));
    final SearchHistoriesNotifier notifier =
        useProvider(searchHistoriesProvider.notifier);
    final StateController<String> searchStateController =
        useProvider(searchStateProvider);
    final StateController<String> searchTextFieldController =
        useProvider(searchTextFieldProvider);

    if (searchHistories.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 24),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text('検索履歴はありません', style: TextStyle(fontSize: 16)),
        ),
      );
    }

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
                    onTap: () async {
                      try {
                        await notifier.delete(
                            searchHistoryId: searchHistories[index].id);
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'エラーが発生しました',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            duration: const Duration(milliseconds: 1000),
                            // width: 162,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: const Color(0xFFEF4444),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        );
                      }
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
