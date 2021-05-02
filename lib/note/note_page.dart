import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/note/note_page_app_bar.dart';
import 'package:qin_memo/note/note_page_body.dart';

class NotePage extends HookWidget {
  const NotePage({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final config = useProvider(noteFetcher(note.id));

    return Scaffold(
      appBar: NotePageAppBar(noteId: note.id),
      body: config.when(
          loading: () => const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Align(
                  child: CircularProgressIndicator(),
                  alignment: Alignment.topCenter,
                ),
              ),
          error: (_, __) => const Text('エラーが発生しました'),
          data: (data) {
            return NotePageBody(noteId: note.id, content: data.content ?? '');
          }),
    );
  }
}
