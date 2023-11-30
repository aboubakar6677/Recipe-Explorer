import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Constants/constants.dart';

class CustomHomeRow extends StatelessWidget {
  final String image1;
  final String text1;
  final String image2;
  final String text2;
  final VoidCallback? ontap1;
  final VoidCallback? ontap2;

  const CustomHomeRow({
    super.key,
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
    this.ontap1,
    this.ontap2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: ontap1,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(15)),
            width: 160,
            height: 175,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    width: 115, height: 115, image1, fit: BoxFit.contain),
                const SizedBox(width: 8),
                Text(text1)
                    .textColor(AppColors.primarycolor)
                    .fontSize(22)
                    .fontFamily("PoppinsMedium"),
              ],
            ),
          ),
        ),
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: ontap2,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(15)),
            width: 160,
            height: 175,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    width: 115, height: 115, image2, fit: BoxFit.contain),
                const SizedBox(width: 8),
                Text(text2)
                    .textColor(AppColors.primarycolor)
                    .fontSize(22)
                    .fontFamily("PoppinsMedium"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
