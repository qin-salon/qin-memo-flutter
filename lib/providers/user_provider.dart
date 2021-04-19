import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';

final StateNotifierProvider<UserNotifier, User?> userProvider =
    StateNotifierProvider<UserNotifier, User?>(
        (ProviderReference ref) => UserNotifier());

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  Future<void> getUser(String userId) async {
    print('$API_ORIGIN/v1/users/$userId');
    final Response<Map<String, dynamic>> response =
        await Dio().get<Map<String, dynamic>>('$API_ORIGIN/v1/users/$userId');
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to fetch user.');
    }
    state = User.fromJson(data);
  }

  Future<void> update({required String name}) async {
    final Response<Map<String, dynamic>> response = await Dio()
        .put<Map<String, dynamic>>('$API_ORIGIN/v1/users/${state?.id}',
            data: <String, String>{'name': name});
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to update user.');
    }
    state = User.fromJson(data);
  }
}
