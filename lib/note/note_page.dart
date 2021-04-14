import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/note/note_page_main.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NotePage extends HookWidget {
  const NotePage({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final NotesNotifier noteNotifier = useProvider(notesProvider.notifier);

    if (note.content != null) {
      return NotePageMain(
        note: note,
        initialContent: note.content,
      );
    }

    return FutureBuilder<String?>(
      future: noteNotifier.getNote(note.id),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        }
        if (snapshot.hasError) {
          return const Text('エラー');
        }
        return NotePageMain(
          note: note,
          initialContent: snapshot.data,
        );
      },
    );
  }
}
