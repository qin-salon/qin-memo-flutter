import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/search_histories_state_model.dart';
import 'package:qin_memo/providers/user_provider.dart';

final searchHistoriesProvider =
    StateNotifierProvider<SearchHistoriesNotifier, SearchHistoriesState>(
        (ref) => SearchHistoriesNotifier(ref.read));

class SearchHistoriesNotifier extends StateNotifier<SearchHistoriesState> {
  SearchHistoriesNotifier(this._read) : super(SearchHistoriesState()) {
    () async {
      try {
        final userId = _read(userProvider).user?.id;
        if (userId == null) {
          state = state.copyWith(histories: [], loading: false);
          return;
        }
        state = state.copyWith(
            histories: await _read(fetchSearchHistories(userId).future),
            loading: false);
      } catch (error) {
        state = state.copyWith(loading: false);
      }
    }();
  }

  final Reader _read;

  Future<void> add({required String keyword}) async {
    final userId = _read(userProvider).user?.id;
    if (userId == null) {
      throw Exception('userId is null');
    }
    final history = await _read(
        createSearchHistory(CreateSearchHistoryFamily(userId, keyword)).future);
    state = state.copyWith(histories: [history, ...state.histories]);
  }

  Future<void> delete({required String searchHistoryId}) async {
    await _read(deleteSearchHistory(searchHistoryId).future);

    state = state.copyWith(
        histories: state.histories
            .where((history) => history.id != searchHistoryId)
            .toList());
  }

  void deleteSearchHistoryState() {
    state = state.copyWith(histories: []);
  }
}
