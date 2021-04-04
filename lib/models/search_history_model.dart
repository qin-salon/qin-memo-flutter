import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_history_model.freezed.dart';
part 'search_history_model.g.dart';

@freezed
class SearchHistory with _$SearchHistory {
  const factory SearchHistory({required String id, required String keyword}) =
      _SearchHistory;
  factory SearchHistory.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryFromJson(json);
}
