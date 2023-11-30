import 'dart:convert';

PastaModelClass modelClassFromJson(String str) =>
    PastaModelClass.fromJson(json.decode(str));

String modelClassToJson(PastaModelClass data) => json.encode(data.toJson());

class PastaModelClass {
  int from;
  int to;
  int count;
  ModelClassLinks links;
  List<Hit> hits;

  PastaModelClass({
    required this.from,
    required this.to,
    required this.count,
    required this.links,
    required this.hits,
  });

  factory PastaModelClass.fromJson(Map<String, dynamic> json) =>
      PastaModelClass(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: ModelClassLinks.fromJson(json["_links"]),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links.toJson(),
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
      };
}

class Hit {
  PastaRecipe recipe;
  HitLinks links;

  Hit({
    required this.recipe,
    required this.links,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: PastaRecipe.fromJson(json["recipe"]),
        links: HitLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe.toJson(),
        "_links": links.toJson(),
      };
}

class HitLinks {
  Self self;

  HitLinks({
    required this.self,
  });

  factory HitLinks.fromJson(Map<String, dynamic> json) => HitLinks(
        self: Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
      };
}

class Self {
  String href;
  Title title;

  Self({
    required this.href,
    required this.title,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
        title: titleValues.map[json["title"]]!,
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "title": titleValues.reverse[title],
      };
}

enum Title { SELF }

final titleValues = EnumValues({"Self": Title.SELF});

class PastaRecipe {
  String uri;
  String label;
  String image;
  Images images;
  List<DietLabel?> dietLabels;
  List<String> healthLabels;
  List<String> ingredientLines;
  List<Ingredient> ingredients;
  List<String> cuisineType;
  List<MealType?> mealType;
  List<String> dishType;

  PastaRecipe({
    required this.uri,
    required this.label,
    required this.image,
    required this.images,
    required this.dietLabels,
    required this.healthLabels,
    required this.ingredientLines,
    required this.ingredients,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  factory PastaRecipe.fromJson(Map<String, dynamic> json) => PastaRecipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: Images.fromJson(json["images"]),
        dietLabels: List<DietLabel?>.from(
            json["dietLabels"].map((x) => dietLabelValues.map[x])),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<MealType?>.from(
            json["mealType"].map((x) => mealTypeValues.map[x])),
        dishType: List<String>.from(json["dishType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images.toJson(),
        "dietLabels": List<dynamic>.from(
            dietLabels.map((x) => dietLabelValues.reverse[x])),
        "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "cuisineType": List<dynamic>.from(cuisineType.map((x) => x)),
        "mealType":
            List<dynamic>.from(mealType.map((x) => mealTypeValues.reverse[x])),
        "dishType": List<dynamic>.from(dishType.map((x) => x)),
      };
}

enum DietLabel { BALANCED, HIGH_FIBER, LOW_FAT }

final dietLabelValues = EnumValues({
  "Balanced": DietLabel.BALANCED,
  "High-Fiber": DietLabel.HIGH_FIBER,
  "Low-Fat": DietLabel.LOW_FAT
});

class Images {
  Regular thumbnail;
  Regular small;
  Regular regular;
  Regular large;

  Images({
    required this.thumbnail,
    required this.small,
    required this.regular,
    required this.large,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: Regular.fromJson(json["THUMBNAIL"]),
        small: Regular.fromJson(json["SMALL"]),
        regular: Regular.fromJson(json["REGULAR"]),
        large: (json['LARGE'] != null)
            ? Regular.fromJson(json["LARGE"])
            : Regular(url: "", width: 0, height: 0),
      );

  Map<String, dynamic> toJson() => {
        "THUMBNAIL": thumbnail.toJson(),
        "SMALL": small.toJson(),
        "REGULAR": regular.toJson(),
        "LARGE": large.toJson(),
      };
}

class Regular {
  String url;
  int width;
  int height;

  Regular({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Regular.fromJson(Map<String, dynamic> json) => Regular(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Ingredient {
  String text;
  double quantity;
  String measure;
  String food;
  double weight;
  String foodCategory;
  String foodId;
  String image;

  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        quantity: json["quantity"]?.toDouble(),
        measure: json["measure"] ?? "",
        food: json["food"],
        weight: json["weight"]?.toDouble(),
        foodCategory: json["foodCategory"] ?? "",
        foodId: json["foodId"],
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "quantity": quantity,
        "measure": measure,
        "food": food,
        "weight": weight,
        "foodCategory": foodCategory,
        "foodId": foodId,
        "image": image,
      };
}

enum MealType { LUNCH_DINNER, SNACK }

final mealTypeValues = EnumValues(
    {"lunch/dinner": MealType.LUNCH_DINNER, "snack": MealType.SNACK});

class ModelClassLinks {
  ModelClassLinks();

  factory ModelClassLinks.fromJson(Map<String, dynamic> json) =>
      ModelClassLinks();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
