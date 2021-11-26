import 'package:bitix/app/auth/login/login_page.dart';
import 'package:bitix/app/home/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static var id;
  static savePreferences(int id, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('id', id);
    pref.setString('value', value);
    pref.commit();
  }

  static getPreferences(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getInt('id');
    if (id == 1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute<void>(builder: (_) => const DashboardPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute<void>(builder: (_) => const AuthPage()));
    }
  }
}
