import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/get_search_histories_provider.dart';

import 'models/search_history_model.dart';

class SearchHistoryList extends StatelessWidget {
  final AsyncValue<List<SearchHistory>> config =
      useProvider(getSearchHistoriesProvider('userId'));

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
              return Container(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
