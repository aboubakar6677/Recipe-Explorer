import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final VoidCallback onTap;
  final bool loading;
  const CustomButton(
      {super.key,
      required this.labelText,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 47,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child:
              //  loading
              //     ? const CircularProgressIndicator(
              //         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              //       )
              //     :
              Text(
            labelText,
          )
                  .textColor(AppColors.whitecolor)
                  .fontSize(20)
                  .fontFamily(FontRes.poppinslight),
        ),
      ),
    );
  }
}
