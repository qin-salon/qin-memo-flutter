import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qin_memo/dialog/custom_alert_dialog.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NotePageBottomSheet extends HookWidget {
  const NotePageBottomSheet({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    final NotesNotifier notifier = useProvider(notesProvider.notifier);
    final Note? note = notifier.getNoteFromState(noteId);
    final bool isPublic = note?.public != null && note?.public == true;

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
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            child: const Icon(
                              Icons.close,
                              size: 20,
                            ),
                            padding: const EdgeInsets.only(top: 10),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () async {
                                    await notifier.patch(noteId: noteId);
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          isPublic ? '非公開にする' : '公開する',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF3B82F6),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Color(0xFF3B82F6),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 24),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 1,
                                  color: Color(0xFFEAEBEC),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    showDialog<CustomAlertDialog>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomAlertDialog(
                                          title: 'メモを削除',
                                          subText: '復元できませんがよろしいですか？',
                                          actionText: 'OK',
                                          action: () => print('delete memo'),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          '削除する',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFEF4444),
                                          ),
                                        ),
                                        Icon(
                                          Icons.delete_outline_sharp,
                                          color: Color(0xFFEF4444),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 24),
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
                    if (!isPublic)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('以下は公開後に操作ができます'),
                      ),
                    if (isPublic) const SizedBox(height: 16),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Twitterでシェアする',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: isPublic
                                              ? Colors.black
                                              : const Color(0xFFC2C6D2),
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: isPublic
                                            ? const Color(0xFF1DA1F2)
                                            : const Color(0xFFC2C6D2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 24),
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 1,
                                  color: Color(0xFFEAEBEC),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '画像化してシェアする',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: isPublic
                                              ? Colors.black
                                              : const Color(0xFFC2C6D2),
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: isPublic
                                            ? const Color(0xFF1DA1F2)
                                            : const Color(0xFFC2C6D2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 24),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'リンクをコピーする',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isPublic
                                  ? Colors.black
                                  : const Color(0xFFC2C6D2),
                            ),
                          ),
                          Icon(
                            Icons.copy,
                            color: isPublic
                                ? Colors.black
                                : const Color(0xFFC2C6D2),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'その他のオプション',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isPublic
                                  ? Colors.black
                                  : const Color(0xFFC2C6D2),
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: isPublic
                                ? Colors.black
                                : const Color(0xFFC2C6D2),
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
      ),
    );
  }
}
