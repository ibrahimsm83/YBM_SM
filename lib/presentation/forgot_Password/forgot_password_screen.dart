import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../resources/index_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: AppSize.sizeHeight(context) * 0.05),
          header(context),
          forgotText(),
          SizedBox(height: 30.h),
          forgotDecText(context),
          SizedBox(height: 20.h),
          box(context, AppStrings.viasms, AppStrings.phoneNumberHint,
              ImageAssets.call, () {
            context.push('/OtpVerify');
          }),
          SizedBox(height: 20.h),
          box(context, AppStrings.viaemail, AppStrings.emailHintText,
              ImageAssets.mailfpw, () {
            context.push('/OtpVerify');
          }),
        ],
      ),
    );
  }

  Widget box(BuildContext context, String title, String subtitle,
      String IconPath, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.borderColor),
              borderRadius: BorderRadius.circular(15.0)),
          width: AppSize.sizeWidth(context),
          child: Row(children: [
            const SizedBox(width: 10.0),
            Container(
              height: AppSize.sizeHeight(context) * 0.15,
              width: AppSize.sizeHeight(context) * 0.15, //130,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.borderColor),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: SvgPicture.asset(IconPath),
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: getmediumStyle(
                      color: ColorManager.blackColor, fontSize: FontSize.s16),
                ),
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: getmediumStyle(
                      color: ColorManager.blackColor, fontSize: FontSize.s18),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget forgotText() {
    return Text(
      AppStrings.Forgotpassword,
      style: getboldStyle(
          color: ColorManager.blackColor,
          fontSize: ScreenUtil().setSp(AppSize.s20)),
    );
  }

  Widget forgotDecText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.1, vertical: 10.0),
      child: Text(
        AppStrings.selectWhichContactDetails,
        textAlign: TextAlign.center,
        style: getRegularStyle(
            color: ColorManager.hintTextColor,
            fontSize: ScreenUtil().setSp(AppSize.s16)),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SvgPicture.asset(
                ImageAssets.backArrow1,
                height: 20,
                width: 20,
              ),
            ),
          ),
          Image.asset(
            ImageAssets.applogoImg,
            height: 150,
            width: 150,
          ),
          const SizedBox(
            child: Text(""),
          ),
        ],
      ),
    );
  }
}
