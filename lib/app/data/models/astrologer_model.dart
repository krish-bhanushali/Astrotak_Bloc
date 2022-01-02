import 'dart:convert';

class Astrologer {
  Astrologer({
    required this.id,
    required this.urlSlug,
    required this.namePrefix,
    required this.firstName,
    required this.lastName,
    required this.aboutMe,
    required this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    required this.rating,
    required this.skills,
    required this.isOnCall,
    required this.freeMinutes,
    required this.additionalMinute,
    required this.images,
    required this.availability,
  });

  final String id;
  final String urlSlug;
  final dynamic namePrefix;
  final String firstName;
  final String lastName;
  final String aboutMe;
  final dynamic profliePicUrl;
  final double experience;
  final List<Language> languages;
  final int minimumCallDuration;
  final double minimumCallDurationCharges;
  final double additionalPerMinuteCharges;
  final bool isAvailable;
  final dynamic rating;
  final List<Skill> skills;
  final bool isOnCall;
  final int freeMinutes;
  final int additionalMinute;
  final Images? images;
  final Availability? availability;

  factory Astrologer.fromJson(String str) =>
      Astrologer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Astrologer.fromMap(Map<String, dynamic> json) {
    return Astrologer(
      id: json["id"].toString(),
      urlSlug: json["urlSlug"],
      namePrefix: json["namePrefix"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      aboutMe: json["aboutMe"] ?? '',
      profliePicUrl: json["profliePicUrl"],
      experience: json["experience"],
      languages: List<Language>.from(
          json["languages"].map((x) => Language.fromMap(x))),
      minimumCallDuration: json["minimumCallDuration"],
      minimumCallDurationCharges: json["minimumCallDurationCharges"],
      additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
      isAvailable: json["isAvailable"],
      rating: json["rating"],
      skills: List<Skill>.from(json["skills"].map((x) => Skill.fromMap(x))),
      isOnCall: json["isOnCall"],
      freeMinutes: json["freeMinutes"],
      additionalMinute: json["additionalMinute"],
      images: json["images"] == null ? null : Images.fromMap(json["images"]),
      availability: json["availability"] == null
          ? null
          : Availability.fromMap(json["availability"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages.map((x) => x.toMap())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating,
        "skills": List<dynamic>.from(skills.map((x) => x.toMap())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images?.toMap() ?? '',
        "availability": availability?.toMap(),
      };
}

class Availability {
  Availability({
    required this.days,
    required this.slot,
  });

  final List<String> days;
  final Slot slot;

  factory Availability.fromJson(String str) =>
      Availability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Availability.fromMap(Map<String, dynamic> json) => Availability(
        days: List<String>.from(json["days"].map((x) => x)),
        slot: Slot.fromMap(json["slot"]),
      );

  Map<String, dynamic> toMap() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "slot": slot.toMap(),
      };
}

class Slot {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
  });

  final String toFormat;
  final String fromFormat;
  final String from;
  final String to;

  factory Slot.fromJson(String str) => Slot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Slot.fromMap(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["fromFormat"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toMap() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };
}

class Images {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });

  final Large small;
  final Large large;
  final Large medium;

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        small: Large.fromMap(json["small"]),
        large: Large.fromMap(json["large"]),
        medium: Large.fromMap(json["medium"]),
      );

  Map<String, dynamic> toMap() => {
        "small": small.toMap(),
        "large": large.toMap(),
        "medium": medium.toMap(),
      };
}

class Large {
  Large({
    required this.imageUrl,
    required this.id,
  });

  final String? imageUrl;
  final int? id;

  factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Large.fromMap(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "imageUrl": imageUrl,
        "id": id,
      };
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Language.fromJson(String str) => Language.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  factory Skill.fromJson(String str) => Skill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Skill.fromMap(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
