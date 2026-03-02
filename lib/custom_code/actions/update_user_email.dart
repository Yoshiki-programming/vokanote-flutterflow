// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> updateUserEmail(
  BuildContext context,
  String? newEmail,
) async {
  // Add your function code here!
  final user = FirebaseAuth.instance.currentUser;

  if (user != null && newEmail != null && newEmail.isNotEmpty) {
    try {
      // 1. メールアドレスの更新
      await user.updateEmail(newEmail);
      // 2. 確認メールの送信
      await user.sendEmailVerification();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('確認メールを送信しました。 / Verification email sent.')),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      // 最近ログインしていない場合に発生するエラー（要再認証）
      if (e.code == 'requires-recent-login') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('再ログインが必要です。 / Please re-login to update email.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Error')),
        );
      }
      return false;
    }
  }
  return false;
}
