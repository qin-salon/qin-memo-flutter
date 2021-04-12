import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_page_main.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NotePage extends HookWidget {
  const NotePage({required this.noteId, required this.noteContent});

  final String noteId;
  final String? noteContent;

  @override
  Widget build(BuildContext context) {
    final NotesNotifier noteNotifier = useProvider(notesProvider.notifier);

    if (noteContent != null) {
      return NotePageMain(
        noteId: noteId,
        initialContent: noteContent,
      );
    }

    return FutureBuilder<String?>(
      future: noteNotifier.getNote(noteId),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        }
        if (snapshot.hasError) {
          return const Text('エラー');
        }
        print(snapshot.data);
        return NotePageMain(
          noteId: noteId,
          initialContent: snapshot.data,
        );
      },
    );
  }
}
