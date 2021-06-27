import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/search_histories_provider.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref.read));

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._read) : super(UserState()) {
    () {
      _auth.userChanges().listen((user) async {
        try {
          if (user == null) {
            state = state.copyWith(user: null, loading: false);
            return;
          }
          final userData = await _read(fetchUser.future);
          if (userData == null) {
            state = state.copyWith(
                user: await _read(addUser.future), loading: false);
            return;
          }
          if (!userData.enabledQinMemo) {
            state = state.copyWith(
                user: await _read(updateUser(
                  User(
                    id: userData.id,
                    name: userData.name,
                    accountId: userData.accountId,
                    avatarUrl: userData.avatarUrl,
                    enabledQinMemo: true,
                  ),
                ).future),
                loading: false);
            return;
          }

          state = state.copyWith(
              user: await _read(fetchUser.future), loading: false);
        } catch (e) {
          state = state.copyWith(user: null, loading: false);
        }
      });
    }();
  }

  final Reader _read;
  final _auth = fa.FirebaseAuth.instance;

  Future<void> add({required User user}) async {
    state = state.copyWith(
        user: await _read(updateUser(user).future), loading: false);
  }

  Future<void> update({required User user}) async {
    state = state.copyWith(
        user: await _read(updateUser(user).future), loading: false);
  }

  Future<void> delete({required String userId}) async {
    await _read(deleteUser(userId).future);
    state = state.copyWith(user: null, loading: false);
  }

  Future<void> deleteMemo({required String userId}) async {
    await _read(deleteUserMemo(userId).future);
    state = state.copyWith(user: null, loading: false);
  }
}
