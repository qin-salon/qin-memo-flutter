import 'package:flutter/material.dart';

class ListOption extends StatelessWidget {
  const ListOption({Key? key, required this.text, this.action})
      : super(key: key);

  final String text;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: action,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              // style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      ),
    );
  }
}
