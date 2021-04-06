import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:qin_memo/models/get_search_histories_response.dart';
import 'package:qin_memo/models/search_history_model.dart';

final FutureProviderFamily<List<SearchHistory>, String>
    getSearchHistoriesProvider =
    FutureProvider.family<List<SearchHistory>, String>(
        (ProviderReference ref, String userId) async {
  final Uri uri =
      Uri.parse('http://127.0.0.1:8080/v1/users/$userId/searchHistories');
  final http.Response response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch user search histories.');
  }
  final Map<String, dynamic> decodedResponse = <String, dynamic>{
    'searchHistories': json.decode(response.body)
  };
  return GetSearchHistoriesResponse.fromJson(decodedResponse).searchHistories;
});
