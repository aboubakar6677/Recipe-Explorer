import 'dart:io';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Widgets/custom_button.dart';
import 'package:recipeapp/Widgets/customtextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  File? image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    loadImagePath();
  }

  Future<void> loadImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  Future<void> saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', path);
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      saveImagePath(pickedFile.path);
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      saveImagePath(pickedFile.path);
    }
  }

  Future<void> showOptions() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          Container(
            color: AppColors.primarycolor,
            child: Column(
              children: [
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  child: const Text('View Picture')
                      .textColor(AppColors.whitecolor),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _viewPhoto();
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(color: AppColors.whitecolor),
                ),
                CupertinoActionSheetAction(
                  child: const Text('Change Picture')
                      .textColor(AppColors.whitecolor),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _changePhoto();
                  },
                ),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            // Handle the cancel action
            Get.back();
          },
          child: const Text('Cancel').textColor(AppColors.blackcolor),
        ),
      ),
    );
  }

  void _viewPhoto() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primarycolor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.file(image!,
                          width: 300, height: 350, fit: BoxFit.cover),
                    )
                  : const Text('No picture available'),
              const SizedBox(height: 2),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Close').textColor(AppColors.whitecolor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePhoto() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                Container(
                  color: AppColors.primarycolor,
                  child: Column(
                    children: [
                      CupertinoActionSheetAction(
                        child: const Text('Photo Gallery')
                            .textColor(AppColors.whitecolor),
                        onPressed: () {
                          Navigator.of(context).pop();

                          getImageFromGallery();
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(color: AppColors.whitecolor),
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Camera')
                            .textColor(AppColors.whitecolor),
                        onPressed: () {
                          Navigator.of(context).pop();

                          getImageFromCamera();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            foregroundColor: AppColors.whitecolor,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back, size: 30)),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Padding(
                    padding: const EdgeInsets.only(left: 18, bottom: 20),
                    child: Row(children: [
                      Text(AppStrings.edit.toUpperCase())
                          .textColor(AppColors.whitecolor)
                          .fontSize(29)
                          .fontFamily(FontRes.poppinsbold)
                    ])))),
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          reverse: false,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: showOptions,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipOval(
                          child: image != null
                              ? Image.file(image!,
                                  width: 120, height: 120, fit: BoxFit.cover)
                              : Image.asset('assets/png/profile.jpg',
                                  fit: BoxFit.cover, height: 120, width: 120),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColors.whitecolor,
                                borderRadius: BorderRadius.circular(60)),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt,
                                  size: 20, color: AppColors.primarycolor),
                              onPressed: showOptions,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    EditProfilefield(
                        keyboardtype: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]'))
                        ],
                        text: 'Name :',
                        hinttext: 'CGIT Institute'),
                    const SizedBox(height: 30),
                    const EditProfilefield(
                        keyboardtype: TextInputType.emailAddress,
                        text: 'Email :',
                        hinttext: 'cgit@gmail.com'),
                    const SizedBox(height: 30),
                    const EditProfilefield(
                        keyboardtype: TextInputType.phone,
                        text: 'Contact :',
                        hinttext: '+92 3011234567'),
                    const SizedBox(height: 30),
                    const EditProfilefield(
                        text: 'Address :', hinttext: 'Kohinoor Plaza 1'),
                  ],
                ),
                const SizedBox(height: 70),
                CustomButton(
                    labelText: AppStrings.updatebutton,
                    onTap: () {
                      Get.back();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
