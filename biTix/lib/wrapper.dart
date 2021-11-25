import 'package:bitix/app/home/dashboard/dashboard_page.dart';
import 'package:bitix/app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    init();
    super.initState();
  }

  String? status;
  SharedPreferences? sharedPreferences;
  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences!.get("status").toString();
    print(status);
  }
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case null:
        return const SplashScreen();
      case "login":
        return const DashboardPage();
      case "logout":
        return const SplashScreen();
      default:
        return const SplashScreen();
    }
  }
}
