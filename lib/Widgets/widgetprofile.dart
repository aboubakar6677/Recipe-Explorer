import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Constants/constants.dart';

class WidgetProfileDetails extends StatelessWidget {
  final String text;
  final String answers;
  final bool forPass;

  final VoidCallback? onpress;
  const WidgetProfileDetails({
    super.key,
    required this.text,
    required this.answers,
    this.onpress,
    required this.forPass,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text)
                    .textColor(AppColors.whitecolor)
                    .fontFamily(FontRes.poppinsbold)
                    .fontSize(15),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              alignment: Alignment.centerLeft,
              width: 170,
              child: Text(answers)
                  .textColor(AppColors.greycolor)
                  .fontSize(15)
                  .textAlignment(TextAlign.center),
            ),
          ],
        ),
        Container(
            child: (forPass)
                ? IconButton(
                    onPressed: onpress,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ))
                : null)
      ],
    );
  }
}
