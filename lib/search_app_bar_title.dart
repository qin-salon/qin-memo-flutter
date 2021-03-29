import 'package:flutter/material.dart';

class SearchAppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          const Flexible(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
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
            onTap: () => print('hello'),
            child: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
    );
  }
}
