import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/note/all_note_list.dart';
import 'package:qin_memo/note/new_note_page.dart';
import 'package:qin_memo/dialog/profile_dialog.dart';
import 'package:qin_memo/providers/notes_provider.dart';
import 'package:qin_memo/providers/theme_provider.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/search/search_page.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final NotesNotifier noteNotifier = useProvider(notesProvider.notifier);
    // final User? userState = useProvider(userProvider());
    final userState =
        useProvider(userProvider('testuser').select((value) => value.user));
    final themeNotifier = useProvider(themeProvider.notifier);
    final _themeFuture = useMemoized(() => themeNotifier.getTheme());
    useFuture(_themeFuture, initialData: null);

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
                  backgroundImage: NetworkImage(userState?.avatarUrl ??
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final String noteId = await noteNotifier.add();
          Navigator.of(context).push<NewNotePage>(
              MaterialPageRoute<NewNotePage>(builder: (BuildContext context) {
            return NewNotePage(noteId: noteId);
          }));
        },
        label: const Text(
          'メモを書く',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
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
                  children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 10.5),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF3B82F6),
                        )),
                    Text(
                      'メモを検索する',
                      style: TextStyle(color: Color(0xFFC2C6D2)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: const Color(0xFFF1F5F9),
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
