import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/search_state_provider.dart';

class SearchAppBarTitle extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final StateController<bool> search = useProvider(searchStateProvider);
    final TextEditingController _controller = useTextEditingController();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          Flexible(
            child: TextField(
              controller: _controller,
              autofocus: true,
              onSubmitted: (String str) {
                search.state = true;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(44, 13, 0, 13),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFFC2C6D2),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(999)),
                      borderSide: BorderSide.none),
                  hintText: '検索',
                  hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
                  filled: true,
                  fillColor: Color(0xFFF1F5F9)),
            ),
          ),
          GestureDetector(
            onTap: () {
              search.state = false;
              _controller.clear();
            },
            child: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
    );
  }
}
