import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qin_memo/pages/note/note_page_app_bar.dart';
import 'package:qin_memo/pages/note/note_editor.dart';

class NewNotePage extends HookWidget {
  const NewNotePage({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotePageAppBar(noteId: noteId, isCreate: true),
      body: NoteEditor(noteId: noteId, content: ''),
    );
  }
}
