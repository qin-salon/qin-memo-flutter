import 'package:flutter/material.dart';
import 'package:qin_memo/privacy_policy.dart';
import 'package:qin_memo/setting/setting_option.dart';

class PrivacyPolicyOption extends StatelessWidget {
  const PrivacyPolicyOption();

  @override
  Widget build(BuildContext context) {
    return SettingOption(
      text: 'プライバシーポリシー',
      action: () {
        Navigator.of(context).push(
          MaterialPageRoute<PrivacyPolicyPage>(
            builder: (BuildContext context) {
              return const PrivacyPolicyPage();
            },
          ),
        );
      },
    );
  }
}
