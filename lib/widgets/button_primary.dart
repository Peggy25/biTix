import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({Key? key, this.textButton = 'Button', this.heightButton = 60, this.widthButton = 250, this.onTap}) : super(key: key);

  final String? textButton;
  final double? heightButton;
  final double? widthButton;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widthButton,
        height: heightButton,
        child: TextButton(
          child: Text(
            textButton!,
            style: fontStyle.copyWith(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            if(onTap != null){
              onTap!();
            }
          },
          style: ButtonStyle(
            // background color
            backgroundColor: MaterialStateProperty.all(ColorApp.darkColor),
            shape: MaterialStateProperty.all(
              // memberi bentuk melengkung dengan radius 10
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
          ),
        ));
  }
}
