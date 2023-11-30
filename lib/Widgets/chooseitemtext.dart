import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Constants/constants.dart';

class ChooseitemText extends StatelessWidget {
  const ChooseitemText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 25),
      child: Row(
        children: [
          const Text(AppStrings.choose)
              .textColor(AppColors.whitecolor)
              .fontSize(24)
              .fontFamily("PoppinsBold  "),
        ],
      ),
    );
  }
}
