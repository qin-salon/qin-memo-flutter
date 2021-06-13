import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NotePageBody extends HookWidget {
  const NotePageBody({required this.noteId, required this.content});

  final String noteId;
  final String content;

  @override
  Widget build(BuildContext context) {
    final noteState = useState(content);
    final notifier = useProvider(notesProvider.notifier);
    final note = useProvider(notesProvider.select(
        (value) => value.notes.firstWhere((note) => note.id == noteId)));

    useEffect(() {
      Future.microtask(
          () => notifier.updateState(note: note.copyWith(content: content)));
    }, []);

    return Container(
      child: TextFormField(
        autofocus: true,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 16),
        initialValue: content,
        onChanged: (String? value) {
          if (value != null) {
            noteState.value = value;
            EasyDebounce.debounce(
                'notedebouncer', const Duration(milliseconds: 1000), () async {
              await notifier.update(
                  note: note.copyWith(content: noteState.value));
            });
          }
        },
        maxLines: 100000000,
        decoration: const InputDecoration(
          hintText: '本文を入力する',
          hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
          border: InputBorder.none,
        ),
      ),
      padding: const EdgeInsets.all(24),
    );
  }
}
