import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note/all_note_list.dart';
import 'package:qin_memo/note/new_note_page.dart';
import 'package:qin_memo/dialog/profile_dialog.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/search/search_page.dart';
import 'package:qin_memo/snack_bar/error_snack_bar.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final NotesNotifier noteNotifier = useProvider(notesProvider.notifier);
    final avatarUrl =
        useProvider(userProvider.select((value) => value.user?.avatarUrl));

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: <Widget>[
          GestureDetector(
            onTap: () => <void>{
              showGeneralDialog(
                barrierLabel: 'Dismiss',
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: const Duration(milliseconds: 200),
                context: context,
                pageBuilder: (BuildContext context, _, __) {
                  return ProfileDialog();
                },
                transitionBuilder: (BuildContext context,
                    Animation<double> anim1, _, Widget child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0, 0),
                            end: const Offset(0, 0.01))
                        .animate(anim1),
                    child: child,
                  );
                },
              )
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Container(
                width: 36,
                height: 36,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9999),
                    child: Image.network(
                      avatarUrl ??
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      errorBuilder: (_, __, ___) {
                        return Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            fit: BoxFit.fitHeight);
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          try {
            final String noteId = await noteNotifier.add();
            Navigator.of(context).push<NewNotePage>(
                MaterialPageRoute<NewNotePage>(builder: (BuildContext context) {
              return NewNotePage(noteId: noteId);
            }));
          } catch (error) {
            showErrorSnackBar(context);
          }
        },
        label: const Text(
          'メモを書く',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                Navigator.of(context).push<SearchPage>(
                  PageRouteBuilder<SearchPage>(
                    pageBuilder: (_, __, ___) => SearchPage(),
                    transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) =>
                        ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                      child: child,
                    ),
                  ),
                );
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10.5),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      'メモを検索する',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Theme.of(context).backgroundColor,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: AllNoteList(),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }
}
