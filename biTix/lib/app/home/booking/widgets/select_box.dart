import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class SelectBox extends StatelessWidget {
  final String? title;
  final Function? onTap;
  const SelectBox({Key? key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 100,
        child: OutlinedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.grey)),
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
            onPressed: () {
              if (onTap != null) {
                onTap!();
              }
            },
            child: Text(
              title!,
              style: fontStyle,
            )));
  }
}
