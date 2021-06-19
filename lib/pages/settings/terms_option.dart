import 'package:flutter/material.dart';
import 'package:qin_memo/pages/settings/setting_option.dart';
import 'package:qin_memo/terms.dart';

class TermsOption extends StatelessWidget {
  const TermsOption();

  @override
  Widget build(BuildContext context) {
    return SettingOption(
      text: '利用規約',
      action: () {
        Navigator.of(context).push(
          MaterialPageRoute<TermsPage>(
            builder: (BuildContext context) {
              return const TermsPage();
            },
          ),
        );
      },
    );
  }
}
