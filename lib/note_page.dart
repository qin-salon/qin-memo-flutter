import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_page_bottom_sheet.dart';
import 'package:qin_memo/providers/get_note_provider.dart';

import 'models/note_model.dart';

class NotePage extends HookWidget {
  const NotePage({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Note> config = useProvider(getNoteProvider(noteId));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<Widget>(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return NotePageBottomSheet(noteId: noteId);
                    },
                  );
                },
                child: const Icon(Icons.more_horiz, color: Colors.black),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        ),
      ),
      body: Container(
        child: config.when(
          loading: () => const Text('loading'),
          error: (_, __) => const Text('エラー'),
          data: (Note note) => Text(note.content ?? ''),
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
