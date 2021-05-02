import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/note/note_page_main.dart';

class NotePage extends HookWidget {
  const NotePage({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    if (note.content != null) {
      return NotePageMain(
        noteId: note.id,
        initialContent: note.content,
      );
    }

    return FutureBuilder<Note?>(
      future: context.read(noteFetcher(note.id).future),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('エラー');
        }
        return NotePageMain(
          noteId: note.id,
          initialContent: snapshot.data?.content,
        );
      },
    );
  }
}
