import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share/share.dart';
import 'package:clipboard/clipboard.dart';
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      // TODO: widthの設定をどうすればいいかわからない
                                      SnackBar(
                                        content: Row(
                                          children: <Widget>[
                                            if (isPublic)
                                              const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              )
                                            else
                                              const Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.white,
                                              ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              isPublic
                                                  ? 'メモを非公開にしました'
                                                  : 'メモを公開しました',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        // width: 162,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                      ),
                                    );
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
                                          action: () async {
                                            await notifier.delete(
                                                noteId: noteId);
                                            Navigator.of(context).popUntil(
                                                (Route<dynamic> route) =>
                                                    route.isFirst);
                                          },
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
                                      children: <Widget>[
                                        const Text(
                                          '削除する',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFEF4444),
                                          ),
                                        ),
                                        SvgPicture.asset('assets/trash.svg'),
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Share.share(
                                        'QinMemoでかきました\nhttps://memo.qin.sh/notes/$noteId');
                                  },
                                  child: Container(
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
                                        SvgPicture.asset('assets/twitter.svg'),
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
                                      SvgPicture.asset('assets/twitter.svg'),
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
                    GestureDetector(
                      onTap: () {
                        FlutterClipboard.copy(
                            'https://memo.qin.sh/notes/$noteId');
                        Navigator.of(context).pop();
                      },
                      child: Container(
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
                            SvgPicture.asset('assets/clipboard-copy.svg'),
                            // Icon(
                            //   Icons.copy,
                            //   color: isPublic
                            //       ? Colors.black
                            //       : const Color(0xFFC2C6D2),
                            // ),
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
                    ),
                    const SizedBox(height: 16),
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
