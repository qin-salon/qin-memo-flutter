import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';

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

  Future<void> update({required String name}) async {
    final Response<Map<String, dynamic>> response = await Dio()
        .put<Map<String, dynamic>>('$API_ORIGIN/v1/users/${state.user?.id}',
            data: <String, String>{'name': name});
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to update user.');
    }
    state = state.copyWith(user: User.fromJson(data), loading: false);
  }
}
