import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/index_manager.dart';

typedef StatusCallback = void Function(FlushbarStatus?);

class CustomSnacksBar {
  CustomSnacksBar._();

  static void showSnackBar(BuildContext context, String message,
      {Widget? icon,
      int? duration,
      Key? key,
      Widget? mainButton,
      StatusCallback? onStatusChange}) {
    Flushbar(
      icon: icon ??
          const Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
          ),
      onStatusChanged: onStatusChange ?? (status) {},
      mainButton: mainButton,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      borderRadius: BorderRadius.circular(8.0),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundGradient: LinearGradient(
        colors: <Color>[
          // AppColors.btncolorOrg,
          // AppColors.btncolorOrg,
          ColorManager.primary,
          ColorManager.primary,
        ],
      ),
      duration: Duration(seconds: duration ?? 2),
    ).show(context);
  }
}
