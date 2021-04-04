import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/models/search_notes_response.dart';
import 'package:qin_memo/providers/search_state_provider.dart';

final AutoDisposeFutureProviderFamily<List<Note>, String> searchNotesProvider =
    FutureProvider.autoDispose.family<List<Note>, String>(
        (AutoDisposeProviderReference ref, String userId) async {
  final String search = ref.watch(searchStateProvider).state;
  if (search == '') {
    return <Note>[];
  }

  final Uri uri =
      Uri.parse('http://127.0.0.1:4010/users/$userId/notes/search?q=$search');
  final http.Response response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch search notes.');
  }
  final Map<String, dynamic> decodedResponse = <String, dynamic>{
    'notes': json.decode(response.body)
  };
  return SearchNotesResponse.fromJson(decodedResponse).notes;
});
