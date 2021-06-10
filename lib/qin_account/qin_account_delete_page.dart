import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/authentication.dart';
import 'package:qin_memo/dialog/custom_alert_dialog.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/walkthrough/walkthrough_page.dart';

class QinAccountDeletePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final user = useProvider(userProvider.select((value) => value.user));
    final notifier = useProvider(userProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          title: const Text('Qinアカウント'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'データの削除',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Qinサービスの削除',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC2C6D2),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Qin Memoを削除',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          child: const Text(
                            '削除する',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: const Color(0xFFF1F5F9),
                            onPrimary: const Color(0xFFEF4444),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            showDialog<CustomAlertDialog>(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: 'Qin Memoを削除',
                                  subText: 'Qin Memoを完全に削除してよろしいですか？',
                                  actionText: 'OK',
                                  action: () async {
                                    try {
                                      final userId = user?.id;
                                      if (userId == null) {
                                        throw Exception('userId is null');
                                      }
                                      await notifier.delete(userId: userId);
                                      await signOut();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute<WalkthroughPage>(
                                        builder: (BuildContext context) {
                                          return WalkthroughPage();
                                        },
                                      ), (Route<dynamic> route) => false);
                                    } catch (error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            'エラーが発生しました',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          // width: 162,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor:
                                              const Color(0xFFEF4444),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 54),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Qinアカウントの削除',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC2C6D2),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'アカウントを削除',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          child: const Text(
                            '削除する',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: const Color(0xFFF1F5F9),
                            onPrimary: const Color(0xFFEF4444),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            showDialog<CustomAlertDialog>(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: 'Qinアカウントの削除',
                                  subText: 'Qinアカウントを完全に削除してよろしいですか？',
                                  actionText: 'OK',
                                  action: () async {
                                    Navigator.of(context).pop();
                                    final userId = user?.id;
                                    if (userId == null) {
                                      return;
                                    }
                                    await notifier.delete(userId: userId);
                                    await signOut();
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ));
  }
}
