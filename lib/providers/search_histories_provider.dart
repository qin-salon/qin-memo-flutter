import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/get_search_histories_response.dart';
import 'package:qin_memo/models/search_history_model.dart';

final StateNotifierProvider<SearchHistoriesNotifier, List<SearchHistory>>
    searchHistoriesProvider =
    StateNotifierProvider<SearchHistoriesNotifier, List<SearchHistory>>(
        (ProviderReference ref) => SearchHistoriesNotifier());

class SearchHistoriesNotifier extends StateNotifier<List<SearchHistory>> {
  SearchHistoriesNotifier() : super(<SearchHistory>[]);

  Future<void> getSearchHistories(String userId) async {
    if (state.isNotEmpty) {
      return;
    }
    final Response<dynamic> response = await Dio()
        .get<dynamic>('http://127.0.0.1:8080/v1/users/$userId/searchHistories');

    if (response.statusCode != 200 || response.data == null) {
      throw Exception('Failed to fetch user searchHistories.');
    }

    final Map<String, dynamic> data = <String, dynamic>{
      'searchHistories': response.data
    };
    state = <SearchHistory>[
      ...state,
      ...GetSearchHistoriesResponse.fromJson(data).searchHistories
    ];
  }

  Future<void> add({required String userId, required String keyword}) async {
    final Response<Map<String, dynamic>> response = await Dio()
        .post<Map<String, dynamic>>(
            'http://127.0.0.1:8080/v1/users/$userId/searchHistories',
            data: <String, String>{'keyword': keyword});
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 201 || data == null) {
      throw Exception('Failed to add searchHistory.');
    }
    final SearchHistory searchHistory = SearchHistory.fromJson(data);
    state = <SearchHistory>[searchHistory, ...state];
  }

  Future<void> delete(
      {required String userId, required String searchHistoryId}) async {
    final Response<void> response = await Dio().delete(
        'http://127.0.0.1:8080/v1/users/$userId/searchHistories/$searchHistoryId',
        data: <dynamic, dynamic>{});
    if (response.statusCode != 200) {
      throw Exception('Failed to delete searchHistory.');
    }

    state = <SearchHistory>[
      ...state
          .where((SearchHistory searchHistory) =>
              searchHistory.id != searchHistoryId)
          .toList()
    ];
  }
}
