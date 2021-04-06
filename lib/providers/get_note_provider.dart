import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:qin_memo/models/note_model.dart';

final AutoDisposeFutureProviderFamily<Note, String> getNoteProvider =
    FutureProvider.autoDispose
        .family<Note, String>((ProviderReference ref, String noteId) async {
  final Uri uri = Uri.parse('http://127.0.0.1:8080/v1/notes/$noteId');
  final http.Response response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch note.');
  }
  final Map<String, dynamic> decodedResponse =
      json.decode(response.body) as Map<String, dynamic>;
  return Note.fromJson(decodedResponse);
});
