import 'dart:convert';

WrapModelClass wrapModelClassFromJson(String str) =>
    WrapModelClass.fromJson(json.decode(str));

String wrapModelClassToJson(WrapModelClass data) => json.encode(data.toJson());

class WrapModelClass {
  final int from;
  final int to;
  final int count;
  final WrapModelClassLinks links;
  final List<Hit> hits;

  WrapModelClass({
    required this.from,
    required this.to,
    required this.count,
    required this.links,
    required this.hits,
  });

  factory WrapModelClass.fromJson(Map<String, dynamic> json) => WrapModelClass(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: WrapModelClassLinks.fromJson(json["_links"]),
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
  final WrapRecipe recipe;
  final HitLinks links;

  Hit({
    required this.recipe,
    required this.links,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: WrapRecipe.fromJson(json["recipe"]),
        links: HitLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe.toJson(),
        "_links": links.toJson(),
      };
}

class HitLinks {
  final Self self;

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
  final String href;
  final Title title;

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

class WrapRecipe {
  final String uri;
  final String label;
  final String image;
  final Images images;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> ingredientLines;
  final List<Ingredient> ingredients;
  final List<String> cuisineType;
  final List<String> mealType;
  final List<String> dishType;

  WrapRecipe({
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

  factory WrapRecipe.fromJson(Map<String, dynamic> json) => WrapRecipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: Images.fromJson(json["images"]),
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<String>.from(json["mealType"].map((x) => x)),
        dishType: List<String>.from(json["dishType"].map((x) => x)??""),

      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images.toJson(),
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "cuisineType": List<dynamic>.from(cuisineType.map((x) => x)),
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
        "dishType": List<dynamic>.from(dishType.map((x) => x)),
      };
}

class Images {
  final Regular thumbnail;
  final Regular small;
  final Regular regular;
  final Regular? large;

  Images({
    required this.thumbnail,
    required this.small,
    required this.regular,
    this.large,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: Regular.fromJson(json["THUMBNAIL"]),
        small: Regular.fromJson(json["SMALL"]),
        regular: Regular.fromJson(json["REGULAR"]),
        large: json["LARGE"] == null ? null : Regular.fromJson(json["LARGE"]),
      );

  Map<String, dynamic> toJson() => {
        "THUMBNAIL": thumbnail.toJson(),
        "SMALL": small.toJson(),
        "REGULAR": regular.toJson(),
        "LARGE": large?.toJson(),
      };
}

class Regular {
  final String url;
  final int width;
  final int height;

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
  final String text;
  final double quantity;
  final String? measure;
  final String food;
  final double weight;
  final String foodCategory;
  final String foodId;
  final String image;

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
        measure: json["measure"],
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

class WrapModelClassLinks {
  WrapModelClassLinks();

  factory WrapModelClassLinks.fromJson(Map<String, dynamic> json) =>
      WrapModelClassLinks();

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
