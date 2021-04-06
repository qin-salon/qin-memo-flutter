import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/get_notes_response.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:http/http.dart' as http;

final StateNotifierProvider<NotesNotifier, List<Note>> notesProvider =
    StateNotifierProvider<NotesNotifier, List<Note>>(
        (ProviderReference ref) => NotesNotifier());

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super(<Note>[]);

  Future<void> getNotes(String userId) async {
    final Uri uri = Uri.parse('http://127.0.0.1:8080/v1/users/$userId/notes');
    final http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch user notes.');
    }
    final Map<String, dynamic> decodedResponse = <String, dynamic>{
      'notes': json.decode(response.body)
    };
    final List<Note> notes = GetNotesResponse.fromJson(decodedResponse).notes;
    state = <Note>[...state, ...notes];
  }

  Future<void> add() async {
    final Uri uri = Uri.parse('http://127.0.0.1:8080/v1/notes');
    final http.Response response = await http.post(uri);
    if (response.statusCode != 201) {
      throw Exception('Failed to add note.');
    }
    final Note note = json.decode(response.body) as Note;
    state = <Note>[...state, note];
  }

  // void remove(String noteId) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id != todoId) todo,
  //   ];
  // }

  // void toggle(String todoId) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id == todoId) todo.copyWith(completed: !todo.completed),
  //   ];
  // }
}
