import 'package:flutter/material.dart';

class SearchHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Next.js',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => print('hello'),
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFFC2C6D2),
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
            ),
          );
        },
      ),
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
    );
  }
}
