import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/get_note_provider.dart';

import 'custom_alert_dialog.dart';
import 'models/note_model.dart';

class NotePage extends HookWidget {
  const NotePage({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Note> config = useProvider(getNoteProvider(noteId));
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
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
                      return Container(
                          child: Wrap(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 40,
                                      child: Container(
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFC2C6D2),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(top: 8),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () =>
                                              Navigator.of(context).pop(),
                                          child: Container(
                                            child: const Icon(
                                              Icons.close,
                                              size: 20,
                                            ),
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const <Widget>[
                                                      Text(
                                                        '公開する',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF3B82F6),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .remove_red_eye_outlined,
                                                        color:
                                                            Color(0xFF3B82F6),
                                                      ),
                                                    ],
                                                  ),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16,
                                                      horizontal: 24),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                  thickness: 1,
                                                  color: Color(0xFFEAEBEC),
                                                ),
                                                GestureDetector(
                                                  behavior:
                                                      HitTestBehavior.opaque,
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    showDialog<
                                                        CustomAlertDialog>(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CustomAlertDialog(
                                                          title: 'メモを削除',
                                                          subText:
                                                              '復元できませんがよろしいですか？',
                                                          actionText: 'OK',
                                                          action: () => print(
                                                              'delete memo'),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Text(
                                                          '削除する',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFFEF4444),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .delete_outline_sharp,
                                                          color:
                                                              Color(0xFFEF4444),
                                                        ),
                                                      ],
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 16,
                                                        horizontal: 24),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF1F5F9),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text('以下は公開後に操作ができます'),
                                    ),
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Twitterでシェアする',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFFC2C6D2),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star_outline,
                                                        color:
                                                            Color(0xFFC2C6D2),
                                                      ),
                                                    ],
                                                  ),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16,
                                                      horizontal: 24),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                  thickness: 1,
                                                  color: Color(0xFFEAEBEC),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const <Widget>[
                                                      Text(
                                                        '画像化してシェアする',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFFC2C6D2),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .star_border_outlined,
                                                        color:
                                                            Color(0xFFC2C6D2),
                                                      ),
                                                    ],
                                                  ),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16,
                                                      horizontal: 24),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF1F5F9),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const <Widget>[
                                          Text(
                                            'リンクをコピーする',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFC2C6D2),
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Color(0xFFC2C6D2),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF1F5F9),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const <Widget>[
                                          Text(
                                            'その他のオプション',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFC2C6D2),
                                            ),
                                          ),
                                          Icon(
                                            Icons.more_horiz,
                                            color: Color(0xFFC2C6D2),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF1F5F9),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
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
        child: config.when(
          loading: () => const Text('loading'),
          error: (_, __) => const Text('エラー'),
          data: (Note note) => Text(note.content ?? ''),
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
