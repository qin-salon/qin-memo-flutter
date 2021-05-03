import 'package:flutter/material.dart';
import 'package:qin_memo/setting/contact_option.dart';
import 'package:qin_memo/setting/open_source_license_option.dart';
import 'package:qin_memo/setting/privacy_policy_option.dart';
import 'package:qin_memo/setting/terms_option.dart';
import 'package:qin_memo/setting/user_id_option.dart';
import 'package:qin_memo/setting/version_option.dart';

class QinAccountSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text('Qinアカウント'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('サポート',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                PrivacyPolicyOption(),
                TermsOption(),
                OpenSourceLicenseOption(),
                ContactOption(),
                VersionOption(),
                UserIdOption(),
              ],
            )
          ],
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
