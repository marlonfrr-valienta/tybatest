// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  final String? formattedAddress;
  final String? icon;
  final String? name;
  // final OpeningHours? openingHours;
  final String? placeId;
  final int? priceLevel;
  final double? rating;

  Restaurant({
    this.formattedAddress,
    this.icon,
    this.name,
    // this.openingHours,
    this.placeId,
    this.priceLevel,
    this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        formattedAddress: json["formatted_address"],
        icon: json["icon"],
        name: json["name"],
        // openingHours: OpeningHours.fromJson(json["opening_hours"]),
        placeId: json["place_id"],
        priceLevel: json["price_level"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress,
        "icon": icon,
        "name": name,
        // "opening_hours": openingHours?.toJson(),
        "place_id": placeId,
        "price_level": priceLevel,
        "rating": rating,
      };
}

// class OpeningHours {
//   final bool? openNow;

//   OpeningHours({
//     this.openNow,
//   });

//   factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
//         openNow: json["open_now"],
//       );

//   Map<String, dynamic> toJson() => {
//         "open_now": openNow,
//       };
// }
