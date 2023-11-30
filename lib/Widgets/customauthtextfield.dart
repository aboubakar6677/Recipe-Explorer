import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipeapp/Constants/constants.dart';

class CustomAuthTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labeltext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;

  const CustomAuthTextfield({
    super.key,
    required this.textEditingController,
    required this.labeltext,
    this.keyboardType,
    this.validate,
    this.obscureText,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      style: const TextStyle(color: AppColors.whitecolor, fontSize: 16),
      keyboardType: keyboardType,
      validator: validate,
      controller: textEditingController,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: AppColors.whitecolor),
        labelStyle: const TextStyle(
            color: AppColors.greycolor,
            fontFamily: "PoppinsLight",
            fontSize: 14),
        isDense: true,
        labelText: labeltext,
        focusedErrorBorder: errorBorder(),
        errorBorder: errorBorder(),
        focusedBorder: border(),
        enabledBorder: border(),
        floatingLabelStyle: const TextStyle(color: AppColors.whitecolor),
      ),
    );
  }

  
}
border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(width: 1, color: AppColors.whitecolor),
    );
  }

  InputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    );
  }