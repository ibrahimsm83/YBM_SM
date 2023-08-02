import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ybm/presentation/resources/extension.dart';
import 'package:ybm/widget/custome_button.dart';
import 'package:ybm/widget/custome_prefix_icon.dart';
import 'package:ybm/widget/custome_snackBaar.dart';
import 'package:ybm/widget/text_form_field.dart';

import '../resources/index_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode node = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // ...
// 1. Create a controller in the state of the StatefulWidget
  final _controller = ValueNotifier<bool>(false);

// 2. In case, you want to call setState on switch changes.
// 2.1. Add event listener, for example in the initState() method.
// ...
  bool _checked = false;

  @override
  void initState() {
    node.addListener(() {
      if (!node.hasFocus) {
        formatNickname();
      }
    });
    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          _checked = true;
        } else {
          _checked = false;
        }
      });
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

              Image.asset(ImageAssets.signInTextImg, height: 80, width: 80),
              //  SizedBox(height: AppSize.s10.h),
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
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.08,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AdvancedSwitch(
                            controller: _controller,
                            activeColor: ColorManager.primary,
                            inactiveColor: Colors.grey,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(15)),
                            width: 35.0,
                            height: 18.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Remember Me",
                            style: getsemiboldStyle(
                                color: ColorManager.headingColor,
                                fontSize: ScreenUtil().setSp(AppSize.s12)),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // print(object)

                          context.push('/ForgotPassword');
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: getsemiboldStyle(
                              color: ColorManager.headingColor,
                              fontSize: ScreenUtil().setSp(AppSize.s12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),
              button(
                  text: AppStrings.signIn,
                  color: ColorManager.primary,
                  onTap: () {
                    CustomSnacksBar.showSnackBar(
                      context,
                      "Login Successfully",
                      icon: Icon(
                        Icons.check,
                        color: ColorManager.whiteColor,
                      ),
                    );
                    // if (_formKey.currentState!.validate()) {
                    //   print(_emailController.text);
                    //   print(_passwordController.text);
                    //   //context.go('/Homepage');
                    //   CustomSnacksBar.showSnackBar(
                    //     context,
                    //     "Login Successfully",
                    //     icon: Icon(
                    //       Icons.check,
                    //       color: ColorManager.whiteColor,
                    //     ),
                    //   );
                    // }
                  }),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child:
              //       Divider(color: ColorManager.hintTextColor, thickness: 0.8),
              // ),
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
                text1: AppStrings.dontHaveAnAccount,
                text2: AppStrings.signup,
                onTap: () => context.push('/SignUp'),
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
