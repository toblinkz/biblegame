import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'token_notifier.dart'; // Import TokenNotifier class

void updateTokenAfterLogin(BuildContext context, String newToken) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userToken', newToken);

  final tokenNotifier = Provider.of<TokenNotifier>(context, listen: false);
  tokenNotifier.setToken(newToken);
}