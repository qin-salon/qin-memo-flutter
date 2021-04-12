import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qin_memo/note_page_main.dart';

class NewNotePage extends HookWidget {
  const NewNotePage({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    return NotePageMain(
      noteId: noteId,
      initialContent: null,
      isCreate: true,
    );
  }
}
