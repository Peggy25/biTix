import 'dart:async';

// import 'package:bitix/app/auth/login/login_page.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:bitix/shared/font_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // membuat durasi halaman saat tampil
  @override
  void initState() {
    // init();
    //set lama durasi
    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      /// pindah ke halaman dalam waktu 2 detik
      PreferenceManager.getPreferences(context);
    });
    super.initState();
  }

  // SharedPreferences? sharedPreferences;
  // void init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences!.setString("status", "logout");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// text Bi Tix
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'B',
                      style: fontStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 30)),
                  TextSpan(
                      text: 'i',
                      style: fontStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 25)),
                  TextSpan(
                      text: ' T',
                      style: fontStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 30)),
                  TextSpan(
                      text: 'i',
                      style: fontStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 25)),
                  TextSpan(
                      text: 'x',
                      style: fontStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
          ),

          //end text
          //space height
          const SizedBox(
            height: 10,
          ),
          //end space
          // circular progress indicator in center
          Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorApp.darkColor),
              ),
            ),
          ),
          // end circular progress indicator
        ],
      ),
    );
  }
}
