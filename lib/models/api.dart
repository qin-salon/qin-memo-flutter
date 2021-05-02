import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';

// ignore: top_level_function_literal_block
final userFetcher = FutureProviderFamily((ref, userId) async {
  try {
    final Response<Map<String, dynamic>> response =
        await Dio().get<Map<String, dynamic>>('$API_ORIGIN/v1/users/$userId');
    final Map<String, dynamic>? data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw Exception('Failed to fetch user.');
    }
    return User.fromJson(data);
  } catch (error) {
    return null;
  }
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

// ignore: top_level_function_literal_block
final notesFetcher = FutureProviderFamily((ref, String userId) async {
  try {
    final Response<dynamic> response =
        await Dio().get<dynamic>('$API_ORIGIN/v1/users/$userId/notes');

    if (response.statusCode != 200 || response.data == null) {
      throw Exception('Failed to fetch user notes.');
    }

    final json = (response.data as List).cast<Map<String, dynamic>>();
    final list = json.map((e) => Note.fromJson(e)).toList();
    return list;
  } catch (error) {
    return <Note>[];
  }
});

// ignore: top_level_function_literal_block
final noteFetcher =
    FutureProvider.autoDispose.family((ref, String noteId) async {
  final note = ref
      .watch(notesProvider('testuser'))
      .notes
      .firstWhere((note) => note.id == noteId);
  if (note.content != null) {
    return note;
  }
  final Response<Map<String, dynamic>> response =
      await Dio().get<Map<String, dynamic>>('$API_ORIGIN/v1/notes/$noteId');
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to fetch note.');
  }
  return Note.fromJson(data);
});

// ignore: top_level_function_literal_block
final notePatcher =
    FutureProvider.autoDispose.family((ref, String noteId) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .patch<Map<String, dynamic>>('$API_ORIGIN/v1/notes/$noteId/public',
          data: <dynamic, dynamic>{});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to patch note.');
  }
  return Note.fromJson(data);
});

// ignore: top_level_function_literal_block
final notePoster = FutureProvider.autoDispose((ref) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .post<Map<String, dynamic>>('$API_ORIGIN/v1/notes',
          data: <dynamic, dynamic>{});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 201 || data == null) {
    throw Exception('Failed to update note.');
  }
  return Note.fromJson(data);
});

final notePuter = FutureProvider.autoDispose.family((ref, Note note) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .put<Map<String, dynamic>>('$API_ORIGIN/v1/notes/${note.id}',
          data: <String, String>{'content': note.content ?? ''});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to update note.');
  }
  return Note.fromJson(data);
});

final noteDeleter =
    FutureProvider.autoDispose.family((ref, String noteId) async {
  final Response<void> response = await Dio()
      .delete('$API_ORIGIN/v1/notes/$noteId', data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete note.');
  }
  return noteId;
});
