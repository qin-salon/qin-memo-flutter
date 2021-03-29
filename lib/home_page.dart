import 'package:flutter/material.dart';
import 'package:qin_memo/new_note_page.dart';
import 'package:qin_memo/note_list.dart';
import 'package:qin_memo/profile_dialog.dart';
import 'package:qin_memo/search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => <void>{
          Navigator.of(context).push<NewNotePage>(
              MaterialPageRoute<NewNotePage>(builder: (BuildContext context) {
            return NewNotePage();
          }))
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
              onTap: () => <Future<SearchPage>>{
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
                ),
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
              child: NoteList(),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }
}
