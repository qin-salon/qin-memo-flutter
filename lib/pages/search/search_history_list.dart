import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/search_history_model.dart';
import 'package:qin_memo/widgets/spinner.dart';
import 'package:qin_memo/providers/search_histories_provider.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/providers/search_text_field_provider.dart';
import 'package:qin_memo/widgets/snack_bar/error_snack_bar.dart';

class SearchHistoryList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final loading =
        useProvider(searchHistoriesProvider.select((value) => value.loading));

    if (loading) {
      return Spinner();
    }

    return _SearchHistoryList();
  }
}

class _SearchHistoryList extends HookWidget {
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
                        showErrorSnackBar(context);
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
