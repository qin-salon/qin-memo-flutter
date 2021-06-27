import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/pages/note/new_note_page.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/widgets/snack_bar/error_snack_bar.dart';

class CustomFloatingActionButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final noteNotifier = useProvider(notesProvider.notifier);

    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () async {
        try {
          final String noteId = await noteNotifier.add();
          Navigator.of(context)
              .push<NewNotePage>(MaterialPageRoute<NewNotePage>(
            builder: (BuildContext context) {
              return NewNotePage(noteId: noteId);
            },
            fullscreenDialog: true,
          ));
        } catch (error) {
          showErrorSnackBar(context);
        }
      },
      label: const Text(
        'メモを書く',
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
