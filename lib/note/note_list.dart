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
        return GestureDetector(
          onTap: () => <void>{
            Navigator.of(context).push<NotePage>(
                MaterialPageRoute<NotePage>(builder: (BuildContext context) {
              return NotePage(note: notes[index]);
            }))
          },
          child: Container(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notes[index].excerpt ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('ほそく'),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        notes[index].updatedOn != null
                            ? DateFormat('yyyy/MM/dd')
                                .format(DateTime.parse(notes[index].updatedOn!))
                            : '不明',
                        style: const TextStyle(color: Color(0xFFC2C6D2)),
                      ),
                      if (notes[index].public)
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
                  color: const Color(0xFFF1F5F9),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(0, 1),
                        blurRadius: 1)
                  ]),
            ),
          ),
        );
      },
    );
  }
}