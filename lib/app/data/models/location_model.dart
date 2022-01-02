// To parse this JSON data, do
//
//     final location = locationFromMap(jsonString);

import 'dart:convert';

class Location {
  Location({
    required this.placeName,
    required this.placeId,
  });

  final String placeName;
  final String placeId;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toMap() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
