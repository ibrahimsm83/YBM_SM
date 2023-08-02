import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ybm/widget/custome_button.dart';
import 'package:ybm/widget/custome_snackBaar.dart';

import '../resources/index_manager.dart';

// ignore: must_be_immutable
class EmailOtpVerifyView extends StatefulWidget {
  String email;
  EmailOtpVerifyView({super.key, required this.email});

  @override
  State<EmailOtpVerifyView> createState() => _EmailOtpVerifyViewState();
}

class _EmailOtpVerifyViewState extends State<EmailOtpVerifyView> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSize.sizeHeight(context) * 0.05),
              header(context),
              otpVerifyText(),
              SizedBox(height: 20.h),
              otpVerifyDecText(context),
              SizedBox(height: AppSize.sizeHeight(context) * 0.06),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.2),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    inactiveColor: ColorManager.borderColor,
                    inactiveFillColor: ColorManager.borderColor,
                    selectedFillColor: ColorManager.borderColor,
                    shape: PinCodeFieldShape.box,
                    errorBorderColor: ColorManager.borderColor,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              SizedBox(height: AppSize.sizeHeight(context) * 0.1),
              button(
                  text: AppStrings.verify,
                  color: ColorManager.primary,
                  onTap: () {
                    context.push('/verifiedCode');
/*
                    if (currentText.length != 4 || currentText != "1234") {
                      errorController!.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() => hasError = true);
                    } else {
                      setState(
                        () {
                          hasError = false;
                          CustomSnacksBar.showSnackBar(
                            context,
                            "OTP Verified!!",
                            icon: Icon(
                              Icons.check,
                              color: ColorManager.whiteColor,
                            ),
                          );
                          context.push('/verifiedCode');
                        },
                      );
                    }*/
                  }),
              SizedBox(height: 10.h),
              textspan(
                text1: AppStrings.dontRecieveCode,
                text2: AppStrings.resendCode,
                onTap: () => CustomSnacksBar.showSnackBar(
                  context,
                  "OTP resend!!",
                  icon: Icon(
                    Icons.check,
                    color: ColorManager.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textspan(
      {String? text1,
      String? text2,
      BuildContext? context,
      Function()? onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14, vertical: AppPadding.p20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: getRegularStyle(
              color: ColorManager.subheadingColor,
              fontSize: ScreenUtil().setSp(AppSize.s12)),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    color: ColorManager.primary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.bold,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.15, vertical: 10.0),
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
                ImageAssets.leftArrow,
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

  Widget otpVerifyText() {
    return Image.asset(
      ImageAssets.emailOtpTextImg,
      //height: 150,
      width: 150,
    );

    // Text(
    //   AppStrings.verifyCode,
    //   style: getboldStyle(
    //       color: ColorManager.blackColor,
    //       fontSize: ScreenUtil().setSp(AppSize.s20)),
    // );
  }

  Widget otpVerifyDecText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.07, vertical: 10.0),
      child: Text(
        "We just sent a 4-digit verification code to ${widget.email} Enter the code in the box below to continue.",
        textAlign: TextAlign.center,
        style: getRegularStyle(
            color: ColorManager.hintTextColor,
            fontSize: ScreenUtil().setSp(AppSize.s14)),
      ),
    );
  }
}
