import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/authentication.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/models/search_history_model.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/constants.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';

final dio = Dio()
  ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    final idToken = await getIdToken();
    options.headers
        .addAll(<String, String>{'Authorization': 'Bearer $idToken'});
    return handler.next(options);
  }));

// ignore: top_level_function_literal_block
final fetchUser = FutureProvider((ref) async {
  try {
    final response =
        await dio.get<Map<String, dynamic>>('$API_ORIGIN/v1/users');
    final Map<String, dynamic>? data = response.data;
    if (data == null) {
      return null;
    }
    return User.fromJson(data);
  } catch (error) {
    return null;
  }
});

// ignore: top_level_function_literal_block
final addUser = FutureProvider.autoDispose((ref) async {
  final authUser = currentUser;
  if (authUser == null) {
    throw Exception('uid is null');
  }
  final Response<Map<String, dynamic>> response = await dio
      .post<Map<String, dynamic>>('$API_ORIGIN/v1/users',
          data: <String, String>{
        'uid': authUser.uid,
        'name': authUser.displayName ?? 'no name',
        'avatarUrl': authUser.photoURL ?? ''
      });
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 201 || data == null) {
    throw Exception('Failed to create user.');
  }

  return User.fromJson(data);
});

// ignore: top_level_function_literal_block
final updateUser = FutureProvider.autoDispose.family((ref, User user) async {
  final response = await dio
      .put<Map<String, dynamic>>('$API_ORIGIN/v1/users/${user.id}', data: {
    'name': user.name,
    'accountId': user.accountId,
    'avatarUrl': user.avatarUrl,
    'enabledQinMemo': user.enabledQinMemo,
  });
  final data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to update user.');
  }

  return User.fromJson(data);
});

// ignore: top_level_function_literal_block
final deleteUser = FutureProvider.family((ref, String userId) async {
  final response = await dio
      .delete<void>('$API_ORIGIN/v1/users/$userId', data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete user.');
  }
});

final deleteUserMemo = FutureProvider.family((ref, String userId) async {
  final response = await dio.delete<void>('$API_ORIGIN/v1/users/$userId/memo',
      data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete memo.');
  }
});

// ignore: top_level_function_literal_block
final fetchNotes = FutureProviderFamily((ref, String userId) async {
  try {
    final Response<dynamic> response =
        await dio.get<dynamic>('$API_ORIGIN/v1/users/$userId/notes');

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
  final notes =
      ref.read(notesProvider).notes.where((note) => note.id == noteId);
  if (notes.isNotEmpty) {
    return notes.first;
  }
  final Response<Map<String, dynamic>> response =
      await dio.get<Map<String, dynamic>>('$API_ORIGIN/v1/notes/$noteId');
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 200 || data == null) {
    throw Exception('Failed to fetch note.');
  }
  return Note.fromJson(data);
});

// ignore: top_level_function_literal_block
final patchNote = FutureProvider.autoDispose.family((ref, String noteId) async {
  final Response<Map<String, dynamic>> response = await dio
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
  final Response<Map<String, dynamic>> response = await dio
      .post<Map<String, dynamic>>('$API_ORIGIN/v1/users/$userId/notes',
          data: <dynamic, dynamic>{});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 201 || data == null) {
    throw Exception('Failed to update note.');
  }
  return Note.fromJson(data);
});

final updateNote = FutureProvider.autoDispose.family((ref, Note note) async {
  final Response<Map<String, dynamic>> response = await dio
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
  final Response<void> response = await dio
      .delete('$API_ORIGIN/v1/notes/$noteId', data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete note.');
  }
  return noteId;
});

final fetchSearchHistories =
    FutureProvider.autoDispose.family((ref, String userId) async {
  final Response<dynamic> response =
      await dio.get<dynamic>('$API_ORIGIN/v1/users/$userId/searchHistories');
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

class CreateSearchHistoryFamily {
  CreateSearchHistoryFamily(this.userId, this.keyword);
  final String userId;
  final String keyword;
}

final createSearchHistory = FutureProvider.autoDispose
    .family((ref, CreateSearchHistoryFamily family) async {
  final Response<Map<String, dynamic>> response = await dio
      .post<Map<String, dynamic>>(
          '$API_ORIGIN/v1/users/${family.userId}/searchHistories',
          data: <String, String>{'keyword': family.keyword});
  final Map<String, dynamic>? data = response.data;
  if (response.statusCode != 201 || data == null) {
    throw Exception('Failed to add searchHistory.');
  }
  return SearchHistory.fromJson(data);
});

final deleteSearchHistory =
    FutureProvider.autoDispose.family((ref, String searchHistoryId) async {
  final Response<void> response = await dio.delete(
      '$API_ORIGIN/v1/searchHistories/$searchHistoryId',
      data: <dynamic, dynamic>{});
  if (response.statusCode != 200) {
    throw Exception('Failed to delete searchHistory.');
  }
});

final searchNotes = FutureProvider.autoDispose<List<Note>>(
    (AutoDisposeProviderReference ref) async {
  final search = ref.watch(searchStateProvider).state;
  final userId = ref.watch(userProvider).user?.id;

  if (search == '' || userId == null) {
    return <Note>[];
  }

  final Response<dynamic> response = await dio
      .get<dynamic>('$API_ORIGIN/v1/users/$userId/notes/search?q=$search');

  if (response.statusCode != 200 || response.data == null) {
    throw Exception('Failed to fetch search notes.');
  }
  final json = (response.data as List).cast<Map<String, dynamic>>();
  final list = json.map((e) => Note.fromJson(e)).toList();
  return list;
});

Future<List<String>> getShareFiles(
    {required String noteId, required DefaultCacheManager cacheManager}) async {
  final response =
      await dio.get<dynamic>('$API_ORIGIN/v1/notes/$noteId/share?page=1');
  final link = response.headers['link'];
  if (link == null) {
    throw Exception('Response header is invalid');
  }
  final page = RegExp(r'\d').stringMatch(link[0]);
  if (page == null) {
    throw Exception('Response header page is invalid');
  }

  List<String> filePaths = [];
  for (int i = 1; i <= int.parse(page); i++) {
    final file = await cacheManager
        .getSingleFile('$API_ORIGIN/v1/notes/$noteId/share?page=$i');
    filePaths = [...filePaths, file.path];
  }

  return filePaths;
}
