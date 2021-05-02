import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note/note_page_bottom_sheet.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NotePageAppBar extends HookWidget with PreferredSizeWidget {
  const NotePageAppBar({required this.noteId, this.isCreate = false});

  final String noteId;
  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    final note = useProvider(notesProvider('testuser').select(
        (value) => value.notes.firstWhere((note) => note.id == noteId)));

    return AppBar(
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
                if (note.public == true)
                  Container(
                    child: const Text(
                      '公開中',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
                  child: SvgPicture.asset('assets/more.svg'),
                ),
              ],
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
