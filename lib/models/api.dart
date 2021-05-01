import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';

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
