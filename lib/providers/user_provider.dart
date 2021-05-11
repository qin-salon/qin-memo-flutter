import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/user_model.dart';

final userProvider =
    StateNotifierProvider.family<UserNotifier, UserState, String>(
        (ref, String userId) => UserNotifier(ref.read, userId));

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._read, this._userId) : super(UserState()) {
    () async {
      state = state.copyWith(
          user: await _read(userFetcher(_userId).future), loading: false);
    }();
  }

  final Reader _read;
  final String _userId;

  Future<void> update({required User user}) async {
    state = state.copyWith(
        user: await _read(userUpdater(user).future), loading: false);
  }
}
