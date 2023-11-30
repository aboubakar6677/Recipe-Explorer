import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Constants/constants.dart';

class WidgetProfileDetails extends StatelessWidget {
  final String text;
  final String answers;
  const WidgetProfileDetails({
    super.key,
    required this.text,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text)
                  .textColor(AppColors.whitecolor)
                  .fontFamily(FontRes.poppinsbold)
                  .fontSize(17),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Text(answers)
              .textColor(AppColors.greycolor)
              .fontSize(16)
              .textAlignment(TextAlign.center),
        ),
      ],
    );
  }
}
