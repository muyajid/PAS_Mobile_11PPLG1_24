import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
  json.decode(str).map((x) => ProductModel.fromJson(x)),
);

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  // FROM API JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    price: (json["price"] ?? 0).toDouble(),
    description: json["description"] ?? "",
    category: categoryValues.map[json["category"]] ?? Category.ELECTRONICS,
    image: json["image"] ?? "",
    rating: json["rating"] != null
        ? Rating.fromJson(json["rating"])
        : Rating(rate: 0, count: 0),
  );

  factory ProductModel.fromDb(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: 0,
      description: "",
      category: categoryValues.map[json["category"]] ?? Category.ELECTRONICS,
      image: json["image"] ?? "",
      rating: Rating(rate: 0, count: 0),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

// ENUM CATEGORY
enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING,
});

// RATING
class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rate: (json["rate"] ?? 0).toDouble(), count: json["count"] ?? 0);

  Map<String, dynamic> toJson() => {"rate": rate, "count": count};
}

// ENUM HELPER
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
