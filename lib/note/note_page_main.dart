import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/note/note_page_bottom_sheet.dart';
import 'package:qin_memo/providers/note_provider.dart';
import 'package:qin_memo/providers/notes_provider.dart';

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
    final ValueNotifier<String> noteState = useState(initialContent ?? '');
    final NotesNotifier noteNotifier = useProvider(notesProvider.notifier);
    final Note? note = useProvider(noteProvider(noteId)).state;

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
                child: isCreate
                    ? const Icon(Icons.close, color: Colors.black)
                    : const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              Row(
                children: <Widget>[
                  if (note?.public == true)
                    Container(
                      child: const Text(
                        '公開中',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999),
                        color: const Color(0xFFFB923C),
                      ),
                    ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      await showModalBottomSheet<Widget>(
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
                    child: SvgPicture.asset('assets/vector.svg'),
                  ),
                ],
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
              noteState.value = value;
              EasyDebounce.debounce(
                  'notedebouncer', const Duration(milliseconds: 1000),
                  () async {
                await noteNotifier.update(
                    noteId: noteId, content: noteState.value);
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
      ),
    );
  }
}
