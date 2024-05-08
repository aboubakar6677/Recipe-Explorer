import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Constants/constants.dart';
import 'package:recipeapp/Controllers/HomeScreen%20Controller/fav_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomItemContainer extends StatefulWidget {
  final String image;
  final String text;
  final VoidCallback ontap;

  const CustomItemContainer({
    super.key,
    required this.image,
    required this.text,
    required this.ontap,
  });

  @override
  State<CustomItemContainer> createState() => _CustomItemContainerState();
}

List<String> favoriteItems = [];

class _CustomItemContainerState extends State<CustomItemContainer> {
  late FavouriteCounterController favouriteCounterController;

  @override
  void initState() {
    super.initState();
    favouriteCounterController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favouriteCounterController.isFavorite(widget.text);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: InkWell(
          onTap: widget.ontap,
          child: Stack(children: [
            SizedBox(
                width: Get.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(14), // Image border
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(100), // Image radius
                        child: Opacity(
                            opacity: 0.4,
                            child: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                          child: CircularProgressIndicator(
                                              color: AppColors.primarycolor,
                                              value: downloadProgress.progress),
                                        ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                imageUrl: widget.image,
                                width: 378,
                                height: 180,
                                fit: BoxFit.cover))))),
            Positioned(
                top: 60,
                left: 55,
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 230),
                    child: Center(
                        child: Text(widget.text)
                            .textColor(AppColors.whitecolor)
                            .fontSize(22)
                            .fontFamily("PoppinsLight  ")
                            .textAlignment(TextAlign.center)))),
            Positioned(
                bottom: 4,
                right: 8,
                child: IconButton(
                    icon: Icon(Icons.favorite,
                        color: isFavorite ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        if (isFavorite) {
                          favouriteCounterController
                              .removeFromFavorites(widget.text);
                        } else {
                          favouriteCounterController
                              .addToFavorites(FavoriteItem(
                            name: widget.text,
                            image: widget.image,
                            ontap: widget.ontap,
                          ));
                        }
                      });
                      // Update the favorite count using GetX controller
                      // favouriteCounterController.addToFavorites(widget.text);
                      // Update shared preferences
                      updateFavoriteItems();
                      // Get.to(() => const FavouriteListScreen());
                    }))
          ]),
        ));
  }
}

// Function to update shared preferences with the current favorite items
void updateFavoriteItems() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('favoriteItems', favoriteItems);
}
