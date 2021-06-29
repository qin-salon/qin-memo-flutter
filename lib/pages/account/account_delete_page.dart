import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/authentication.dart';
import 'package:qin_memo/pages/account/account_app_bar.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/search_histories_provider.dart';
import 'package:qin_memo/widgets/dialog/custom_alert_dialog.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/widgets/snack_bar/error_snack_bar.dart';
import 'package:qin_memo/pages/walkthrough/walkthrough_page.dart';

class AccountDeletePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final user = useProvider(userProvider.select((value) => value.user));
    final notifier = useProvider(userProvider.notifier);
    final notesNotifier = useProvider(notesProvider.notifier);
    final searchHistoryNotifier = useProvider(searchHistoriesProvider.notifier);

    return Scaffold(
        appBar: AccountAppBar(icon: const Icon(Icons.arrow_back_ios)),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'データの削除',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 32),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Qinサービスの削除',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Qin Memoを削除',
                          style: Theme.of(context).textTheme.subtitle1,
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
                            primary: Theme.of(context).backgroundColor,
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
                                      await notifier.deleteMemo(userId: userId);
                                      notesNotifier.deleteNotesState();
                                      searchHistoryNotifier
                                          .deleteSearchHistoryState();
                                      await signOut();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute<WalkthroughPage>(
                                        builder: (BuildContext context) {
                                          return WalkthroughPage();
                                        },
                                      ), (Route<dynamic> route) => false);
                                    } catch (error) {
                                      showErrorSnackBar(context);
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
                    Text(
                      'Qinアカウントの削除',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'アカウントを削除',
                          style: Theme.of(context).textTheme.subtitle1,
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
                            primary: Theme.of(context).backgroundColor,
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
                                    try {
                                      final userId = user?.id;
                                      if (userId == null) {
                                        return;
                                      }
                                      await notifier.delete(userId: userId);
                                      await signOut();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute<WalkthroughPage>(
                                        builder: (BuildContext context) {
                                          return WalkthroughPage();
                                        },
                                      ), (Route<dynamic> route) => false);
                                    } catch (e) {
                                      showErrorSnackBar(context);
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
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ));
  }
}
