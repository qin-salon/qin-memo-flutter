import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/models/search_history_model.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';
import 'package:qin_memo/providers/notes_provider.dart';

// ignore: top_level_function_literal_block
final fetchUser = FutureProviderFamily((ref, userId) async {
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
final updateUser = FutureProvider.autoDispose.family((ref, User user) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .put<Map<String, dynamic>>('$API_ORIGIN/v1/users/${user.id}',
          data: <String, String>{
        'name': user.name,
        'userName': user.userName,
        'avatarUrl': user.avatarUrl
      });
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to update user.');
  }

  return User.fromJson(data);
});

// ignore: top_level_function_literal_block
final deleteUser = FutureProviderFamily((ref, String userId) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .delete<Map<String, dynamic>>('$API_ORIGIN/v1/users/$userId',
          data: <dynamic, dynamic>{});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to delete user.');
  }
});

// ignore: top_level_function_literal_block
final fetchNotes = FutureProviderFamily((ref, String userId) async {
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
final fetchNote = FutureProvider.autoDispose.family((ref, String noteId) async {
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
final patchNote = FutureProvider.autoDispose.family((ref, String noteId) async {
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
final createNote =
    FutureProvider.autoDispose.family((ref, String userId) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .post<Map<String, dynamic>>('$API_ORIGIN/v1/users/$userId/notes',
          data: <dynamic, dynamic>{});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 201 || data == null) {
    throw Exception('Failed to update note.');
  }
  return Note.fromJson(data);
});

final updateNote = FutureProvider.autoDispose.family((ref, Note note) async {
  final Response<Map<String, dynamic>> response = await Dio()
      .put<Map<String, dynamic>>('$API_ORIGIN/v1/notes/${note.id}',
          data: <String, String>{'content': note.content ?? ''});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to update note.');
  }
  return Note.fromJson(data);
});

final deleteNote =
    FutureProvider.autoDispose.family((ref, String noteId) async {
  final Response<void> response = await Dio()
      .delete('$API_ORIGIN/v1/notes/$noteId', data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete note.');
  }
  return noteId;
});

final fetchSearchHistories =
    FutureProvider.autoDispose.family((ref, String userId) async {
  final Response<dynamic> response =
      await Dio().get<dynamic>('$API_ORIGIN/v1/users/$userId/searchHistories');
  if (response.statusCode == 404) {
    return <SearchHistory>[];
  }
  if (response.statusCode != 200 || response.data == null) {
    throw Exception('Failed to fetch user searchHistories.');
  }
  final json = (response.data as List).cast<Map<String, dynamic>>();
  final list = json.map((e) => SearchHistory.fromJson(e)).toList();
  return list;
});

final createSearchHistory =
    FutureProvider.autoDispose.family((ref, String keyword) async {
  // TODO: testuserを修正
  final Response<Map<String, dynamic>> response = await Dio()
      .post<Map<String, dynamic>>(
          '$API_ORIGIN/v1/users/testuser/searchHistories',
          data: <String, String>{'keyword': keyword});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 201 || data == null) {
    throw Exception('Failed to add searchHistory.');
  }
  return SearchHistory.fromJson(data);
});

final deleteSearchHistory =
    FutureProvider.autoDispose.family((ref, String searchHistoryId) async {
  final Response<void> response = await Dio().delete(
      '$API_ORIGIN/v1/searchHistories/$searchHistoryId',
      data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete searchHistory.');
  }
});
