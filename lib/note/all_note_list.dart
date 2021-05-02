import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note/note_list.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';

class AllNoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notesLoading =
        useProvider(notesProvider('testuser').select((value) => value.loading));
    final userLoading =
        useProvider(userProvider('testuser').select((value) => value.loading));

    if (notesLoading && userLoading) {
      return const CircularProgressIndicator();
    }

    return NoteListContainer();
  }
}

class NoteListContainer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notesState = useProvider(notesProvider('testuser'));
    if (notesState.notes.isEmpty) {
      return const Text('メモがありません', style: TextStyle(fontSize: 16));
    }
    return NoteList(notes: notesState.notes);
  }
}
