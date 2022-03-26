import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  final String? formattedAddress;
  final String? icon;
  final String? name;
  final String? placeId;
  final int? priceLevel;
  final double? rating;

  Restaurant({
    this.formattedAddress,
    this.icon,
    this.name,
    this.placeId,
    this.priceLevel,
    this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        formattedAddress: json["formatted_address"],
        icon: json["icon"],
        name: json["name"],
        placeId: json["place_id"],
        priceLevel: json["price_level"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress,
        "icon": icon,
        "name": name,
        "place_id": placeId,
        "price_level": priceLevel,
        "rating": rating,
      };
}
