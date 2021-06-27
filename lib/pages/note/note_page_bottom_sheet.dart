import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/widgets/snack_bar/error_snack_bar.dart';
import 'package:qin_memo/widgets/snack_bar/success_snack_bar.dart';
import 'package:share/share.dart';
import 'package:clipboard/clipboard.dart';
import 'package:qin_memo/widgets/dialog/custom_alert_dialog.dart';
import 'package:qin_memo/providers/notes_provider.dart';

class NotePageBottomSheet extends HookWidget {
  const NotePageBottomSheet({required this.noteId});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    final NotesNotifier notifier = useProvider(notesProvider.notifier);
    final note = useProvider(notesProvider.select(
        (value) => value.notes.firstWhere((note) => note.id == noteId)));
    final bool isPublic = note.public == true;

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
                          color: Theme.of(context).disabledColor,
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
                                    try {
                                      await notifier.patch(noteId: noteId);
                                      Navigator.of(context).pop();
                                      showSuccessSnackBar(
                                        context: context,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            if (isPublic)
                                              const Icon(
                                                Icons.close,
                                                size: 18,
                                                color: Colors.white,
                                              )
                                            else
                                              const Icon(
                                                Icons.check_circle_outline,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              isPublic
                                                  ? 'メモを非公開にしました'
                                                  : 'メモを公開しました',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                        width: isPublic ? 186 : 162,
                                      );
                                    } catch (error) {
                                      Navigator.of(context).pop();
                                      showErrorSnackBar(context);
                                    }
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
                                        Icon(
                                          isPublic
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: const Color(0xFF3B82F6),
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
                                            try {
                                              await notifier.delete(
                                                  noteId: noteId);
                                              Navigator.of(context).popUntil(
                                                  (Route<dynamic> route) =>
                                                      route.isFirst);
                                            } catch (error) {
                                              Navigator.of(context).pop();
                                              showErrorSnackBar(context);
                                            }
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
                        color: Theme.of(context).backgroundColor,
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
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.color
                                                  : Theme.of(context)
                                                      .disabledColor),
                                        ),
                                        SvgPicture.asset('assets/twitter.svg',
                                            color: isPublic
                                                ? null
                                                : Theme.of(context)
                                                    .disabledColor),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 24),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 1,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      final cacheManager =
                                          DefaultCacheManager();

                                      final filePaths = await getShareFiles(
                                          noteId: noteId,
                                          cacheManager: cacheManager);
                                      Share.shareFiles(filePaths);
                                      await cacheManager.emptyCache();
                                    } catch (error) {
                                      Navigator.of(context).pop();
                                      showErrorSnackBar(context);
                                    }
                                  },
                                  child: Container(
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
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.color
                                                : Theme.of(context)
                                                    .disabledColor,
                                          ),
                                        ),
                                        SvgPicture.asset('assets/twitter.svg',
                                            color: isPublic
                                                ? null
                                                : Theme.of(context)
                                                    .disabledColor),
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
                        color: Theme.of(context).backgroundColor,
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
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/clipboard-copy.svg',
                              color: isPublic
                                  ? Theme.of(context).textTheme.bodyText1?.color
                                  : Theme.of(context).disabledColor,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
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
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
