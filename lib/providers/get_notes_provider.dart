import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:qin_memo/models/get_notes_response.dart';
import 'package:qin_memo/models/note_model.dart';

final FutureProviderFamily<List<Note>, String> getNotesProvider =
    FutureProvider.family<List<Note>, String>(
        (ProviderReference ref, String userId) async {
  final Uri uri = Uri.parse('http://127.0.0.1:4010/users/$userId/notes');
  final http.Response response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch user notes.');
  }
  final Map<String, dynamic> decodedResponse = <String, dynamic>{
    'notes': json.decode(response.body)
  };
  return GetNotesResponse.fromJson(decodedResponse).notes;
});
