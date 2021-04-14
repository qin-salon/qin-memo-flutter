import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/get_notes_response.dart';
import 'package:qin_memo/models/note_model.dart';

final StateNotifierProvider<NotesNotifier, List<Note>> notesProvider =
    StateNotifierProvider<NotesNotifier, List<Note>>(
        (ProviderReference ref) => NotesNotifier());

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super(<Note>[]);

  Future<void> getNotes(String userId) async {
    final Response<dynamic> response = await Dio()
        .get<dynamic>('http://127.0.0.1:8080/v1/users/$userId/notes');

    if (response.statusCode != 200 || response.data == null) {
      throw Exception('Failed to fetch user notes.');
    }

    final Map<String, dynamic> data = <String, dynamic>{'notes': response.data};
    state = <Note>[...state, ...GetNotesResponse.fromJson(data).notes];
  }

  Note? getNoteFromState(String noteId) {
    final Iterable<Note> note = state.where((Note note) => note.id == noteId);
    if (note.isEmpty) {
      return null;
    }
    return note.first;
  }

  Future<String?> getNote(String noteId) async {
    final Response<Map<String, dynamic>> response = await Dio()
        .get<Map<String, dynamic>>('http://127.0.0.1:8080/v1/notes/$noteId');
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to fetch user note.');
    }
    return Note.fromJson(data).content;
  }

  Future<String> add() async {
    final Response<Map<String, dynamic>> response = await Dio()
        .post<Map<String, dynamic>>('http://127.0.0.1:8080/v1/notes',
            data: <dynamic, dynamic>{});
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 201 || data == null) {
      throw Exception('Failed to update note.');
    }
    final Note note = Note.fromJson(data);
    state = <Note>[note, ...state];
    return note.id;
  }

  Future<void> update({required String noteId, required String content}) async {
    final Response<Map<String, dynamic>> response = await Dio()
        .put<Map<String, dynamic>>('http://127.0.0.1:8080/v1/notes/$noteId',
            data: <String, String>{'content': content});
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to update note.');
    }
    state = <Note>[
      Note.fromJson(data),
      ...state.where((Note note) => note.id != noteId).toList(),
    ];
  }

  Future<void> patch({required String noteId}) async {
    final Note? note = getNoteFromState(noteId);
    if (note == null) {
      throw Exception('Invalid note id.');
    }
    final Response<Map<String, dynamic>> response = await Dio()
        .patch<Map<String, dynamic>>(
            'http://127.0.0.1:8080/v1/notes/$noteId/public',
            data: <dynamic, dynamic>{});
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to patch note.');
    }

    state = <Note>[
      note.copyWith(
          public: Note.fromJson(data).public,
          updatedOn: Note.fromJson(data).updatedOn),
      ...state.where((Note note) => note.id != noteId).toList(),
    ];
  }
}
