import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qin_memo/models/search_history_model.dart';

part 'get_search_histories_response.freezed.dart';
part 'get_search_histories_response.g.dart';

@freezed
class GetSearchHistoriesResponse with _$GetSearchHistoriesResponse {
  const factory GetSearchHistoriesResponse(
          {required List<SearchHistory> searchHistories}) =
      _GetSearchHistoriesResponse;
  factory GetSearchHistoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSearchHistoriesResponseFromJson(json);
}
