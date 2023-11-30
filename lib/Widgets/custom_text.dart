// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:recipeapp/Constants/constants.dart';


class CustomText extends StatelessWidget {
  final String text;
  double? fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  double? height;

  CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.color = AppColors.blackcolor,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
        overflow: overflow,
      ),
      textAlign: textAlign,
    );
  }
}
