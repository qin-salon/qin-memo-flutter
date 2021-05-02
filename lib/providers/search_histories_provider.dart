import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/search_histories_state_model.dart';

final searchHistoriesProvider = StateNotifierProvider.family<
    SearchHistoriesNotifier,
    SearchHistoriesState,
    String>((ref, String userId) => SearchHistoriesNotifier(ref.read, userId));

class SearchHistoriesNotifier extends StateNotifier<SearchHistoriesState> {
  SearchHistoriesNotifier(this._read, this._userId)
      : super(SearchHistoriesState()) {
    () async {
      state = state.copyWith(
          histories: await _read(searchHistoriesFetcher(_userId).future),
          loading: false);
    }();
  }

  final Reader _read;
  final String _userId;

  Future<void> add({required String userId, required String keyword}) async {
    final history = await _read(createSearchHistory(keyword).future);
    state = state.copyWith(histories: [history, ...state.histories]);
  }

  Future<void> delete(
      {required String userId, required String searchHistoryId}) async {
    await _read(deleteSearchHistory(searchHistoryId).future);

    state = state.copyWith(
        histories: state.histories
            .where((history) => history.id != searchHistoryId)
            .toList());
  }
}
