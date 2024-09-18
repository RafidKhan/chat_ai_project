import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/k_colors.dart';
import '../../utils/styles/k_text_style.dart';

class GlobalTextFormField extends StatelessWidget {
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? maxlength;
  final AutovalidateMode? autovalidateMode;
  final bool? readOnly;
  final bool? enabled;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final int? line;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Color? errorColor;
  final Color? errorBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final Widget? labelWidget;

  const GlobalTextFormField({
    super.key,
    this.obscureText,
    this.textInputType,
    this.controller,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.maxlength,
    this.initialValue,
    this.autovalidateMode,
    this.readOnly,
    this.enabled,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.line = 1,
    this.style,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.errorColor,
    this.errorBorderColor,
    this.inputFormatters,
    this.focusNode,
    this.onTap,
    this.labelWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: line,
      style: style ?? KTextStyle.customTextStyle(),
      autovalidateMode: autovalidateMode,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      onTap: onTap,
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: KColor.black.color,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: onChanged,
      maxLength: maxlength,
      inputFormatters: inputFormatters,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 14.w,
        ),
        errorMaxLines: 5,
        errorStyle: TextStyle(
          color: errorColor,
        ),
        prefixIcon: prefixIcon,
        prefix: prefix,
        hintText: hintText,
        label: labelWidget,
        labelText: labelWidget == null ? labelText : null,
        labelStyle: labelWidget == null
            ? labelStyle ?? KTextStyle.customHintTextStyle(fontSize: 13.sp)
            : null,
        filled: true,
        counterText: "",
        fillColor: fillColor ?? KColor.white.color,
        suffixIcon: suffixIcon,
        suffix: suffix,
        hintStyle: hintStyle ?? KTextStyle.customHintTextStyle(fontSize: 13.sp),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: KColor.gradient2.color, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: errorBorderColor ?? KColor.red.color, width: 1.w),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: errorBorderColor ?? KColor.red.color, width: 1.w),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: KColor.grey.color, width: 1.w),
        ),
      ),
      validator: validator,
      readOnly: readOnly ?? false,
      enabled: enabled,
    );
  }
}
