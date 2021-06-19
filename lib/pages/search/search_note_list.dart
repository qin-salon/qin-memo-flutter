import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/widgets/spinner.dart';
import 'package:qin_memo/pages/note/note_list.dart';

class SearchNoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final config = useProvider(searchNotes);

    return config.when(
        loading: () => Spinner(),
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
