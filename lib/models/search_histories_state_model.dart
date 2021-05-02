import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qin_memo/models/search_history_model.dart';

part 'search_histories_state_model.freezed.dart';
part 'search_histories_state_model.g.dart';

@freezed
class SearchHistoriesState with _$SearchHistoriesState {
  factory SearchHistoriesState({
    @Default(<SearchHistory>[]) List<SearchHistory> histories,
    @Default(true) bool loading,
  }) = _SearchHistoriesState;
  factory SearchHistoriesState.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoriesStateFromJson(json);
}
