import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/get_notes_provider.dart';

import 'models/note_model.dart';
import 'note_page.dart';

class NoteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Note>> config =
        useProvider(getNotesProvider('userId'));

    return config.when(
        loading: () => const Text('loading'),
        error: (_, __) => const Text('error'),
        data: (List<Note> notes) {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => <void>{
                  Navigator.of(context).push<NotePage>(
                      MaterialPageRoute<NotePage>(
                          builder: (BuildContext context) {
                    return NotePage();
                  }))
                },
                child: Container(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          notes[index].excerpt,
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
                            const Text(
                              '2021/03/25',
                              style: TextStyle(color: Color(0xFFC2C6D2)),
                            ),
                            if (notes[index].public)
                              Container(
                                child: const Text(
                                  '公開',
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
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
        });
  }
}
