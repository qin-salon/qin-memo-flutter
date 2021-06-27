import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qin_memo/pages/home/app_bar_icon_button.dart';
import 'package:qin_memo/pages/home/custom_floating_action_buttton.dart';
import 'package:qin_memo/pages/note/note_list.dart';
import 'package:qin_memo/pages/search/search_page.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _navigateSearch = useCallback(() {
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
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: <Widget>[AppBarIconButton()],
      ),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _navigateSearch,
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
                      style: Theme.of(context).textTheme.subtitle2,
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
              child: NoteListContainer(),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }
}
