import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_list.dart';
import 'package:qin_memo/providers/notes_provider.dart';

import 'models/note_model.dart';

class AllNoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final NotesNotifier notifier = useProvider(notesProvider.notifier);
    final Future<void> _fetchNotes =
        useMemoized(() => notifier.getNotes('testuser'));
    final AsyncSnapshot<void> snapshot =
        useFuture<void>(_fetchNotes, initialData: null);

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Text('loading');
    }
    if (snapshot.hasError) {
      return const Text('えらー');
    }
    return NoteListContainer();
  }
}

class NoteListContainer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final List<Note> notes = useProvider<List<Note>>(notesProvider);
    return NoteList(notes: notes);
  }
}
