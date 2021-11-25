import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class BoxSelected extends StatelessWidget {
  const BoxSelected(
      {Key? key,
      this.isSelected,
      this.isEnabled,
      this.width,
      this.height,
      this.text,
      this.onTap,
      this.textStyle})
      : super(key: key);
  final bool? isSelected;
  final bool? isEnabled;
  final double? width;
  final double? height;
  final String? text;
  final Function? onTap;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (!isEnabled!)
                  ? const Color(0xFFE4E4E4)
                  : isSelected!
                      ? ColorApp.darkColor
                      : Colors.transparent,
              border: Border.all(
                  color: (!isEnabled!)
                      ? const Color(0xFFE4E4E4)
                      : isSelected!
                          ? Colors.transparent
                          : const Color(0xFFE4E4E4))),
          child: Center(
            child: Text(
              text ?? "None",
              style: (textStyle ?? fontStyle)
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400,color: (isSelected!) ? Colors.white : Colors.black),
            ),
          ),
        ));
  }
}
