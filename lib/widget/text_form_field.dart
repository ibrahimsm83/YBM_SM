import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../presentation/resources/index_manager.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatefulWidget {
  String? hintText;
  bool obscureText;
  double horizontalMergin;
  int maxLines;
  Color fillColor;
  TextInputType? keyboardType;
  TextEditingController? controller;
  Widget? suffixIcon;
  FocusNode? focusNode;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  CustomeTextFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.fillColor = Colors.white,
    this.keyboardType,
    this.focusNode,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.horizontalMergin = 0.06,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  late bool _pwShow;
  @override
  void initState() {
    _pwShow = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * widget.horizontalMergin),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        obscureText: _pwShow,
        focusNode: widget.focusNode,
        controller: widget.controller,
        maxLines: widget.maxLines,
        style: getRegularStyle(color: ColorManager.textInputColor),
        decoration: InputDecoration(
          filled: true,
          errorMaxLines: 2,
          //isCollapsed: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon ?? null,
          hintStyle: getmediumStyle(color: ColorManager.hintTextColor),
          contentPadding: const EdgeInsets.fromLTRB(14, 14.0, 14.0, 14.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  BorderSide(color: ColorManager.borderColor, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  BorderSide(color: ColorManager.borderColor, width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: ColorManager.redColor, width: 1.5)),
          suffixIcon: widget.suffixIcon ??
              Visibility(
                visible: widget.obscureText,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pwShow = !_pwShow;
                    });
                  },
                  child: _pwShow
                      ? Icon(
                          Icons.visibility_off,
                          color: ColorManager.hintTextColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: ColorManager.hintTextColor,
                        ),
                ),
              ),
        ),
      ),
    );
  }
}
