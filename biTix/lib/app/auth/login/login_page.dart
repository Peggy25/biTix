import 'package:bitix/app/auth/models/user.dart';
import 'package:bitix/app/auth/register/register_page.dart';
import 'package:bitix/app/home/dashboard/dashboard_page.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // show and hide password condition
  bool isShow = true;

  void showPass() {
    setState(() {
      isShow = !isShow;
    });
  }

  ///
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  ///
  @override
  void initState() {
    // getCache();
    super.initState();
  }

  // void getCache() async {
  //   SharedPreferences local;
  //   local = await SharedPreferences.getInstance();
  //   Object? status = local.get('status');
  //   print(status);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),

                /// text title
                ///
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
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        TextSpan(
                            text: ' T',
                            style: fontStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        TextSpan(
                            text: 'i',
                            style: fontStyle.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        TextSpan(
                            text: 'x',
                            style: fontStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                ),

                /// end text title
                ///
                /// =======form login==========
                ///
                /// space height
                const SizedBox(
                  height: 50,
                ),

                /// end space
                ///
                /// input text email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
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
                /// button login
                ButtonPrimary(
                  heightButton: 50,
                  textButton: 'Masuk',
                  onTap: () {
                    if (emailController!.text != dummyUser.email ||
                        passwordController!.text != '12345') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Email atau password salah',
                        style: fontStyle.copyWith(color: Colors.white),
                      )));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                              builder: (_) => const DashboardPage()));
                    }
                  },
                ),

                /// end button
                ///
                /// space height
                const SizedBox(
                  height: 100,
                ),

                /// end space
                ///
                /// row text
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Belum punya akun?',
                //       style: fontStyle.copyWith(fontSize: 13),
                //     ),
                //     TextButton(
                //       onPressed: () {
                //         Navigator.pushReplacement(
                //             context,
                //             MaterialPageRoute<void>(
                //                 builder: (_) => const RegisterPage()));
                //       },
                //       child: Text(
                //         'Daftar Sekarang',
                //         style: fontStyle.copyWith(fontSize: 13),
                //       ),
                //     )
                //   ],
                // )

                /// end row
                ///
                /// =========end form login===========
              ],
            ),
          ),
        ),
      ),
    );
  }
}
