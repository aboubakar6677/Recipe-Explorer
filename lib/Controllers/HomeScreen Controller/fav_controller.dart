import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteCounterController extends GetxController {
  RxList<FavoriteItem> favoriteItems = <FavoriteItem>[].obs;

  // Method to check if an item is a favorite
  bool isFavorite(String itemName) {
   return favoriteItems.any((item) => item.name == itemName);
  }

  // Method to add an item to favorites
  void addToFavorites(FavoriteItem item) {
    print("Adding item to favorites: $item");
     favoriteItems.add(item);
  }

  // Method to remove an item from favorites
  void removeFromFavorites(String itemName) {
      favoriteItems.removeWhere((item) => item.name == itemName);
  }
}

class FavoriteItem {
  final String name;
  final String image;
  final VoidCallback ontap;
  

  FavoriteItem({
    required this.name,
    required this.image,
    required this.ontap,
  });
}
