import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/providers/search_text_field_provider.dart';

class SearchAppBarTitle extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final StateController<String> searchStateController =
        useProvider(searchStateProvider);
    final StateController<String> searchTextFieldController =
        useProvider(searchTextFieldProvider);
    final TextEditingController _controller = useTextEditingController();
    _controller.text = searchTextFieldController.state;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );

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
              onChanged: (String value) {
                searchTextFieldController.state = value;
              },
              controller: _controller,
              autofocus: true,
              onSubmitted: (String str) {
                searchStateController.state = str;
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
              searchStateController.state = '';
              searchTextFieldController.state = '';
            },
            child: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
    );
  }
}
