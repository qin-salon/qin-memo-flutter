import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_list.dart';
import 'package:qin_memo/providers/search_notes_provider.dart';

import 'models/note_model.dart';

class SearchNoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Note>> config =
        useProvider(searchNotesProvider('userId'));

    return config.when(
        loading: () => const Text('loading'),
        error: (_, __) => const Text('えらー'),
        data: (List<Note> notes) {
          return NoteList(notes: notes);
        });
  }
}