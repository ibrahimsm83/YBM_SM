import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ybm/presentation/resources/extension.dart';
import 'package:ybm/widget/custome_button.dart';
import 'package:ybm/widget/custome_prefix_icon.dart';
import 'package:ybm/widget/custome_snackBaar.dart';
import 'package:ybm/widget/text_form_field.dart';

import '../resources/index_manager.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode node = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confPwController = TextEditingController();

  @override
  void initState() {
    node.addListener(() {
      if (!node.hasFocus) {
        formatNickname();
      }
    });

    super.initState();
  }

  void formatNickname() {
    _emailController.text = _emailController.text.replaceAll(" ", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //topImage(),
              SizedBox(height: AppSize.sizeHeight(context) * 0.05),
              Image.asset(
                ImageAssets.applogoImg,
                height: 150,
                width: 150,
              ),

              Image.asset(ImageAssets.signUpTextImg, height: 80, width: 80),

              CustomeTextFormField(
                hintText: AppStrings.fullName,
                prefixIcon: CustomPrefixIcon(iconPath: ImageAssets.profileIcon),
                controller: _nameController,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s15.h),
              CustomeTextFormField(
                hintText: AppStrings.emailhintText,
                prefixIcon: CustomPrefixIcon(iconPath: ImageAssets.mail),
                focusNode: node,
                controller: _emailController,
                //fillColor: ColorManager.primarydarkColor,
                validator: (String? val) {
                  formatNickname();
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterEmailAddress;
                  } else if (val.isValidEmail) {
                    return null;
                  }
                  return 'Invalid Email';
                },
              ),
              SizedBox(height: AppSize.s15.h),
              CustomeTextFormField(
                controller: _passwordController,
                obscureText: true,
                prefixIcon:
                    CustomPrefixIcon(iconPath: ImageAssets.passwordIcon),
                hintText: AppStrings.yourPassword,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterPassword;
                  } else if (val.isValidPassword) {
                    return null;
                  }
                  return AppStrings.passwordvalidator;
                },
              ),
              SizedBox(height: AppSize.s15.h),
              CustomeTextFormField(
                controller: _confPwController,
                obscureText: true,
                prefixIcon:
                    CustomPrefixIcon(iconPath: ImageAssets.passwordIcon),
                hintText: AppStrings.confirmPassword,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterPassword;
                  } else if (val.isValidPassword) {
                    return null;
                  }
                  return AppStrings.passwordvalidator;
                },
              ),

              SizedBox(height: 30.h),
              button(
                  text: AppStrings.signUPC,
                  color: ColorManager.primary,
                  onTap: () {
                    context.push('/EmailOtpVerify/${"demouser@gmail.com"}');
                    // if (_formKey.currentState!.validate()) {
                    //   if (_confPwController.text == _passwordController.text) {
                    //     CustomSnacksBar.showSnackBar(
                    //       context,
                    //       "SignUp Successfully",
                    //       icon: Icon(
                    //         Icons.check,
                    //         color: ColorManager.whiteColor,
                    //       ),
                    //     );
                    //     context
                    //         .push('/EmailOtpVerify/${_emailController.text}');
                    //   } else {
                    //     CustomSnacksBar.showSnackBar(
                    //         context, AppStrings.passwordNotMatched);
                    //   }
                    // }
                  }),

              SizedBox(height: 1.h),
              ortext(),
              SizedBox(height: 1.h),
              googleFbButton(ImageAssets.googleIcon, AppStrings.loginWithGoogle,
                  () {
                print("google taped");
              }),
              SizedBox(height: 10.h),
              googleFbButton(
                  ImageAssets.facebookIcon, AppStrings.loginwithFoogle, () {
                print("google taped");
              }),
              SizedBox(height: 10.h),
              textspan(
                text1: AppStrings.youHaveAnAccount,
                text2: AppStrings.signInsml,
                onTap: () => Navigator.of(context).pop(),
              ),
              // SizedBox(height: 1.h),
              SizedBox(height: 10.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget googleFbButton(
    String iconPath,
    String title,
    Function()? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppSize.sizeWidth(context) * 0.15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: ColorManager.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Set the shadow color
                spreadRadius: 2, // Set the spread radius of the shadow
                blurRadius: 10, // Set the blur radius of the shadow
                offset: Offset(0, 1), // Set the offset of the shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(iconPath),
                SizedBox(width: 20.0),
                Text(title),
              ],
            ),
          ),
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
          isSufixIcon: true,
          style: getmediumStyle(
            color: ColorManager.whiteColor,
            fontSize: ScreenUtil().setSp(AppSize.s12),
          ),
          onTap: onTap),
    );
  }

  Widget ortext() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          AppStrings.or,
          style: getRegularStyle(
            color: ColorManager.subheadingColor,
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
                    color: ColorManager.secondary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }
}
