import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: prefer_const_constructors_in_immutables
  AccountAppBar({
    Key? key,
    required this.icon,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final Icon icon;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: icon,
        ),
      ),
      title: SvgPicture.asset('assets/qin-account.svg',
          color: Theme.of(context).textTheme.bodyText1?.color),
    );
  }
}
