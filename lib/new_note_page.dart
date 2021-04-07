import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NewNotePage extends HookWidget {
  const NewNotePage({required this.noteId});
  final String noteId;

  @override
  Widget build(BuildContext context) {
    final NotesNotifier notifier = useProvider(notesProvider.notifier);

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
                  await notifier.update(noteId: noteId, content: 'テストです');
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, color: Colors.black),
              ),
              GestureDetector(
                onTap: () => print('hello'),
                child: const Icon(Icons.more_horiz, color: Colors.black),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        ),
      ),
      body: Container(
        child: const TextField(
          autofocus: true,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
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
