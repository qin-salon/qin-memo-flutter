import 'package:flutter/material.dart';
import 'package:qin_memo/open_source_license.dart';
import 'package:qin_memo/pages/settings/setting_option.dart';

class OpenSourceLicenseOption extends StatelessWidget {
  const OpenSourceLicenseOption();

  @override
  Widget build(BuildContext context) {
    return SettingOption(
      text: 'オープンソースライセンス',
      action: () {
        Navigator.of(context).push(
          MaterialPageRoute<OpenSourceLicensePage>(
            builder: (BuildContext context) {
              return const OpenSourceLicensePage();
            },
          ),
        );
      },
    );
  }
}
