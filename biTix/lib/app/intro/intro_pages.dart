import 'package:bitix/app/auth/login/login_page.dart';
import 'package:bitix/shared/assets.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  @override
  void initState(){
    setCache();
    super.initState();
  }

  void setCache()async{
    SharedPreferences locale = await SharedPreferences.getInstance();
    locale.setString("status", "logout");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // image
          Expanded(
            flex: 3,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 245,
                child: Image.asset(ImageApp.get(ImageApp.img_home_cinema)),
              ),
            ),
          ),

          ///end image

          // text
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 250,
              child: Text(
                'Nikmati cara memesan tiket bioskop tanpa ribet',
                style: fontStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          //end text

          //button mulai
          ButtonPrimary(
            heightButton: 50,
            textButton: 'Mulai',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute<void>(builder: (_) => const AuthPage()));
            },
          ),
          //end button
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
