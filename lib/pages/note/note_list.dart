import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/pages/note/note_item.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';

class NoteListContainer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notesState = useProvider(notesProvider);
    final notesLoading =
        useProvider(notesProvider.select((value) => value.loading));
    final userLoading =
        useProvider(userProvider.select((value) => value.loading));

    if (notesLoading || userLoading) {
      return const CircularProgressIndicator();
    }
    if (notesState.notes.isEmpty) {
      return const Text('メモがありません', style: TextStyle(fontSize: 16));
    }

    return NoteList(notes: notesState.notes);
  }
}

class NoteList extends StatelessWidget {
  const NoteList({required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return NoteItem(note: notes[index]);
      },
    );
  }
}
