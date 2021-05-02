import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/providers/constants.dart';
import 'package:qin_memo/providers/search_state_provider.dart';

final searchNotesProvider = FutureProvider.autoDispose
    .family<List<Note>, String>(
        (AutoDisposeProviderReference ref, String userId) async {
  final String search = ref.watch(searchStateProvider).state;

  if (search == '') {
    return <Note>[];
  }

  final Response<dynamic> response = await Dio()
      .get<dynamic>('$API_ORIGIN/v1/users/$userId/notes/search?q=$search');

  if (response.statusCode != 200 || response.data == null) {
    throw Exception('Failed to fetch search notes.');
  }
  final json = (response.data as List).cast<Map<String, dynamic>>();
  final list = json.map((e) => Note.fromJson(e)).toList();
  return list;
});
