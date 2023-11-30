import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:recipeapp/Constants/constants.dart';

void startLoader(BuildContext context) {
  Loader.show(
    context,
    progressIndicator: const CircularProgressIndicator(
      color: AppColors.primarycolor,
    ),
  );
}

void stopLoader(BuildContext context) {
  Loader.hide();
}
