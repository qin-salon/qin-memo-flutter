import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/pages/note/note_page.dart';

class Excerpt {
  const Excerpt({this.title = '新規メモ', this.description = ''});

  final String title;
  final String description;
}

class NoteItem extends StatelessWidget {
  const NoteItem({required this.note});

  final Note note;

  Excerpt _createExcerpt(String? text) {
    if (text == null) {
      return const Excerpt();
    }
    final List<String> excerpts =
        text.split('\n').where((String value) => value.isNotEmpty).toList();
    if (excerpts.isEmpty) {
      return const Excerpt();
    }
    if (excerpts.length == 1) {
      return Excerpt(title: excerpts[0]);
    }
    return Excerpt(title: excerpts[0], description: excerpts[1]);
  }

  @override
  Widget build(BuildContext context) {
    final excerpts = _createExcerpt(note.excerpt);

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
                excerpts.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                excerpts.description,
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
