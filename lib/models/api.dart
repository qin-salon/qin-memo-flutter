import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';
import 'package:qin_memo/providers/user_provider.dart';

// ignore: top_level_function_literal_block
final userFetcher = FutureProviderFamily((ref, userId) async {
  final Response<Map<String, dynamic>> response =
      await Dio().get<Map<String, dynamic>>('$API_ORIGIN/v1/users/$userId');
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to fetch user.');
  }

  return User.fromJson(data);
});

// ignore: top_level_function_literal_block
final userUpdater = FutureProviderFamily((ref, String name) async {
  final user = ref.watch(userProvider('testuser')).user;
  if (user?.id == null) {
    return user;
  }
  final Response<Map<String, dynamic>> response = await Dio()
      .put<Map<String, dynamic>>('$API_ORIGIN/v1/users/${user?.id}',
          data: <String, String>{'name': name});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to update user.');
  }

  return User.fromJson(data);
});
