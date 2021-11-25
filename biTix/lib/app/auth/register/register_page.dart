import 'package:bitix/app/auth/login/login_page.dart';
import 'package:bitix/app/auth/models/register.dart';
import 'package:bitix/app/auth/upload_profile/upload_profile.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, this.registrationUser}) : super(key: key);
  final RegistrationUser? registrationUser;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // show and hide password condition
  bool isShow = true;

  void showPass() {
    setState(() {
      isShow = !isShow;
    });
  }

  // controller

  TextEditingController? fullNameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // on backpress

      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute<void>(builder: (_) => const AuthPage()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Daftar',
            style: fontStyle,
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///
                  /// =====form register====
                  ///
                  /// space height
                  const SizedBox(
                    height: 50,
                  ),

                  /// end space
                  ///
                  ///  input text full name
                  TextFormField(
                    controller: fullNameController,
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    decoration: InputDecoration(
                        focusColor: ColorApp.darkColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorApp.darkColor)),
                        hintText: 'Full Name',
                        hintStyle: TextStyle(color: ColorApp.darkColor),
                        labelStyle: TextStyle(color: ColorApp.darkColor),
                        labelText: 'Full Name',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorApp.darkColor,
                                style: BorderStyle.solid))),
                  ),

                  /// end input text
                  ///
                  /// space height
                  const SizedBox(
                    height: 20,
                  ),

                  /// end space
                  ///
                  /// input text email
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusColor: ColorApp.darkColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorApp.darkColor)),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(color: ColorApp.darkColor),
                        labelStyle: TextStyle(color: ColorApp.darkColor),
                        labelText: 'Email Address',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorApp.darkColor,
                                style: BorderStyle.solid))),
                  ),

                  /// end input text
                  ///
                  /// space height
                  const SizedBox(
                    height: 20,
                  ),

                  /// end space
                  ///
                  /// input text password
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isShow,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: showPass,
                            icon: Icon(
                              isShow ? Icons.visibility_off : Icons.visibility,
                              color: ColorApp.darkColor,
                            )),
                        focusColor: ColorApp.darkColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorApp.darkColor)),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: ColorApp.darkColor),
                        labelStyle: TextStyle(color: ColorApp.darkColor),
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorApp.darkColor,
                                style: BorderStyle.solid))),
                  ),

                  /// end input text
                  ///
                  /// space height
                  const SizedBox(
                    height: 100,
                  ),

                  /// end space
                  ///
                  /// button next
                  ButtonPrimary(
                    heightButton: 50,
                    textButton: 'Lanjutkan',
                    onTap: () {
                      if (fullNameController!.text == "" ||
                          emailController!.text == "" ||
                          passwordController!.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          'Harus Di isi semua',
                          style: fontStyle.copyWith(color: Colors.white),
                        )));
                      } else {
                        RegistrationUser registrationUser = RegistrationUser(
                            email: emailController!.text,
                            name: fullNameController!.text,
                            password: passwordController!.text,
                            profileImage: null);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (_) => UploadProfile(
                                      registrationUser: registrationUser,
                                    )));
                      }
                    },
                  ),

                  /// end button
                  ///
                  /// space height
                  const SizedBox(
                    height: 100,
                  ),

                  ///end space
                  ///
                  /// =======end form login======
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
