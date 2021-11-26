import 'package:bitix/app/splash/splash_screen.dart';
import 'package:bitix/shared/assets.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/shared/preference_manager.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: fontStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// image profile
            Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(ImageApp.get(ImageApp.img_user_pic)),
                      fit: BoxFit.cover),
                ),
              ),
            ),

            /// end image profile
            ///
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Peggy Raihannisa Zakiyyahannas',
                style: fontStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                '21120119130111',
                style: fontStyle,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonPrimary(
              heightButton: 52,
              onTap: () {
                PreferenceManager.savePreferences(0, "logout");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const SplashScreen()));
              },
              textButton: 'Keluar',
            )
          ],
        ),
      ),
    );
  }
}
