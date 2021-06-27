import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info/package_info.dart';

class VersionListOption extends HookWidget {
  const VersionListOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packageInfo = useMemoized(PackageInfo.fromPlatform);
    final snapshot = useFuture(packageInfo, initialData: null);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'バージョン',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            snapshot.data?.version ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
    );
  }
}
