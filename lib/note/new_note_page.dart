import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/note/note_page_main.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NewNotePage extends HookWidget {
  const NewNotePage({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    final Note? note =
        useProvider(notesProvider.notifier).getNoteFromState(noteId);

    if (note == null) {
      return const Text('エラー');
    }

    return NotePageMain(
      note: note,
      initialContent: null,
      isCreate: true,
    );
  }
}
