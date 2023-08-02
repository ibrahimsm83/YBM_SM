import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ybm/presentation/resources/index_manager.dart';

// ignore: must_be_immutable
class CustomPrefixIcon extends StatelessWidget {
  String iconPath;
  CustomPrefixIcon({required this.iconPath});
  @override
  Widget build(BuildContext context) {
    // Replace this with your desired custom icon widget
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset(iconPath,
          color: ColorManager
              .hintTextColor), // Replace with your custom icon asset
    );
  }
}
