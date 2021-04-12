import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note_page_bottom_sheet.dart';
import 'package:qin_memo/providers/notes_provider.dart';

final AutoDisposeStateProvider<String> noteStateProvider =
    StateProvider.autoDispose<String>((AutoDisposeProviderReference ref) => '');

class NotePageMain extends HookWidget {
  const NotePageMain(
      {required this.noteId,
      required this.initialContent,
      this.isCreate = false});

  final String noteId;
  final String? initialContent;
  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    final StateController<String> noteState = useProvider(noteStateProvider);
    final NotesNotifier noteNotifier = useProvider(notesProvider.notifier);

    useEffect(() {
      Future<void>.microtask(() {
        noteState.state = initialContent ?? '';
      });
    }, <Object>[]);

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
                onTap: () async {
                  await noteNotifier.update(
                      noteId: noteId, content: noteState.state);
                  Navigator.pop(context);
                },
                child: isCreate
                    ? const Icon(Icons.close, color: Colors.black)
                    : const Icon(Icons.arrow_back_ios, color: Colors.black),
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
        child: TextFormField(
          autofocus: true,
          initialValue: initialContent,
          onChanged: (String? value) {
            if (value != null) {
              noteState.state = value;
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
      ),
    );
  }
}
