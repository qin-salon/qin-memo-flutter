import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/note/note_page.dart';

class NoteList extends StatelessWidget {
  const NoteList({required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return NoteItem(
          note: notes[index],
        );
      },
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({required this.note});

  final Note note;

  List<String> _createExcerpt(String text) {
    final List<String> excerpts =
        text.split('\n').where((String value) => value.isNotEmpty).toList();
    if (excerpts.isEmpty) {
      return <String>['新規メモ', ''];
    }
    if (excerpts.length == 1) {
      return <String>[excerpts[0], ''];
    }
    return excerpts;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> excerpts = _createExcerpt(note.excerpt ?? '');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<NotePage>(
            builder: (BuildContext context) {
              return NotePage(note: note);
            },
          ),
        );
      },
      child: Container(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                excerpts[0],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                excerpts[1],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    note.updatedOn != null
                        ? DateFormat('yyyy/MM/dd')
                            .format(DateTime.parse(note.updatedOn!))
                        : '不明',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  if (note.public)
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
                ],
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).cardColor,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 1),
                    blurRadius: 1)
              ]),
        ),
      ),
    );
  }
}
