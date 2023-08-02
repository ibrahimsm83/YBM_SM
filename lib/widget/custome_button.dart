import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ybm/presentation/resources/assets_manager.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  bool isSufixIcon;
  Color? color;
  Function()? onTap;
  TextStyle? style;

  CustomeButton(
      {Key? key,
      this.onTap,
      this.text,
      this.isSufixIcon = false,
      this.style,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Set the shadow color
              spreadRadius: 5, // Set the spread radius of the shadow
              blurRadius: 30, // Set the blur radius of the shadow
              offset: Offset(0, 1), // Set the offset of the shadow
            ),
          ],
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: isSufixIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      text!,
                      style: style,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: SvgPicture.asset(ImageAssets.arrowRightIcon,
                          color: Colors.white),
                    ),
                  ],
                )
              : Text(
                  text!,
                  style: style,
                ),
        )),
      ),
    );
  }
}
