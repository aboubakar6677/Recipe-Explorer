import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipeapp/Constants/constants.dart';

class EditProfilefield extends StatelessWidget {
  final String text;

  final String hinttext;
  final TextInputType? keyboardtype;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textEditingController;

  const EditProfilefield({
    super.key,
    required this.text,
    required this.hinttext,
    this.keyboardtype,
    this.inputFormatters,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(text).textColor(AppColors.whitecolor).fontSize(16)
              ],
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextFormField(
                  controller: textEditingController,
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardtype,
                  style: const TextStyle(
                      color: AppColors.whitecolor, fontSize: 16),
                  decoration: InputDecoration(
                      isDense: true,
                      errorBorder: errorBorder(),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.whitecolor)),
                      floatingLabelStyle:
                          const TextStyle(color: AppColors.whitecolor),
                      hintText: hinttext,
                      hintStyle: const TextStyle(
                          fontFamily: FontRes.poppinsextralight,
                          color: AppColors.greycolor,
                          fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputBorder errorBorder() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    );
  }
}
