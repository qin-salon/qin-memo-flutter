import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/search_histories_provider.dart';
import 'package:qin_memo/providers/search_state_provider.dart';
import 'package:qin_memo/providers/search_text_field_provider.dart';
import 'package:qin_memo/widgets/snack_bar/error_snack_bar.dart';

class SearchAppBarTitle extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final SearchHistoriesNotifier notifier =
        useProvider(searchHistoriesProvider.notifier);
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
            child: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: TextField(
              onChanged: (String value) {
                searchTextFieldController.state = value;
              },
              controller: _controller,
              autofocus: true,
              onSubmitted: (String str) async {
                searchStateController.state = str;
                try {
                  if (str == '') {
                    return;
                  }
                  await notifier.add(keyword: str);
                } catch (error) {
                  showErrorSnackBar(context);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(44, 13, 0, 13),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFC2C6D2),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  borderSide: BorderSide.none,
                ),
                hintText: '検索',
                hintStyle: const TextStyle(color: Color(0xFFC2C6D2)),
                filled: true,
                fillColor: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              searchStateController.state = '';
              searchTextFieldController.state = '';
            },
            child: const Icon(Icons.close),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
    );
  }
}
