import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/normal_loading.dart';
import 'package:qin_memo/note/note_list.dart';
import 'package:qin_memo/providers/search_notes_provider.dart';

class SearchNoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final config = useProvider(searchNotesProvider('testuser'));

    return config.when(
        loading: () => NormalLoading(),
        error: (_, __) => const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('見つかりませんでした', style: TextStyle(fontSize: 16)),
              ),
            ),
        data: (List<Note> notes) {
          return NoteList(notes: notes);
        });
  }
}
