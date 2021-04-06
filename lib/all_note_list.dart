import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_list.dart';
import 'package:qin_memo/providers/notes_provider.dart';

import 'models/note_model.dart';

class AllNoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final Future<void> _fetchNotes =
        useProvider(notesProvider.notifier).getNotes('testuser');

    return FutureBuilder<void>(
      future: _fetchNotes,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        }
        if (snapshot.hasError) {
          return const Text('エラー');
        }
        return NoteListContainer();
      },
    );
  }
}

class NoteListContainer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final List<Note> notes = useProvider<List<Note>>(notesProvider);
    return NoteList(notes: notes);
  }
}
