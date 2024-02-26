import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final Widget? prefixIcon, suffixIcon;
  final String? text, hintText, label, numCode;
  final bool? enabled, obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLine, maxLength;
  final TextInputAction? textInputAction;

  const TextFieldWidget({
    required this.controller,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.hintText,
    this.text,
    this.keyboardType,
    super.key,
    this.autofillHints,
    this.inputFormatters,
    this.maxLine,
    this.maxLength,
    this.obscureText,
    this.label,
    this.numCode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      maxLength: maxLength,
      enabled: enabled,
      style: textTheme.titleSmall,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textAlign: TextAlign.end,
      cursorColor: AppColor.tiffanyColor,
      maxLines: maxLine,
      validator: validator,
      decoration: InputDecoration(
        hintStyle: textTheme.labelMedium,
        hintText: hintText,
        labelStyle: textTheme.headlineSmall,
        labelText: label,
        prefixIcon: prefixIcon,
        prefixText: numCode,
        suffixIcon: suffixIcon,
      ),
      textInputAction: textInputAction,
    );
  }
}
