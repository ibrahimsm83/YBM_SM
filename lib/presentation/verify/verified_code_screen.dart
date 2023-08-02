import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ybm/widget/custome_button.dart';
import 'package:ybm/widget/custome_snackBaar.dart';

import '../resources/index_manager.dart';

class VerifiedCodeView extends StatelessWidget {
  const VerifiedCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SizedBox(height: AppSize.sizeHeight(context) * 0.05),
          SizedBox(height: 2),
          Image.asset(
            ImageAssets.applogoImg,
            height: 150,
            width: 150,
          ),
          Image.asset(
            ImageAssets.verifiedImg,
            height: 100,
          ),
          otpVerifyText(),
          otpVerifyDecText(context),
          SizedBox(height: AppSize.sizeHeight(context) * 0.1),
          button(
              context: context,
              text: "Continue",
              color: ColorManager.primary,
              onTap: () {
                CustomSnacksBar.showSnackBar(
                  context,
                  "You have Successfully Verified",
                  icon: Icon(
                    Icons.check,
                    color: ColorManager.whiteColor,
                  ),
                );
              }),
          SizedBox(height: AppSize.sizeHeight(context) * 0.05),
        ],
      ),
    );
  }

  Widget button(
      {Function()? onTap, String? text, Color? color, BuildContext? context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.15, vertical: 10.0),
      child: CustomeButton(
          color: color!,
          text: text ?? "",
          //isSufixIcon: true,
          style: getmediumStyle(
            color: ColorManager.whiteColor,
            fontSize: ScreenUtil().setSp(AppSize.s12),
          ),
          onTap: onTap),
    );
  }

  Widget otpVerifyText() {
    return Text(
      AppStrings.verified,
      style: getboldStyle(
          color: ColorManager.blackColor,
          fontSize: ScreenUtil().setSp(AppSize.s16)),
    );
  }

  Widget otpVerifyDecText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.07, vertical: 10.0),
      child: Text(
        AppStrings.verifyCodeDesc,
        textAlign: TextAlign.center,
        style: getRegularStyle(
            color: ColorManager.hintTextColor,
            fontSize: ScreenUtil().setSp(AppSize.s14)),
      ),
    );
  }
}
