// To parse this JSON data, do
//
//     final panchang = panchangFromMap(jsonString);

import 'dart:convert';

class Panchang {
  Panchang({
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.vedicSunrise,
    required this.vedicSunset,
    required this.tithi,
    required this.nakshatra,
    required this.yog,
    required this.karan,
    required this.hinduMaah,
    required this.paksha,
    required this.ritu,
    required this.sunSign,
    required this.moonSign,
    required this.ayana,
    required this.panchangYog,
    required this.vikramSamvat,
    required this.shakaSamvat,
    required this.vkramSamvatName,
    required this.shakaSamvatName,
    required this.dishaShool,
    required this.dishaShoolRemedies,
    required this.nakShool,
    required this.moonNivas,
    required this.abhijitMuhurta,
    required this.rahukaal,
    required this.guliKaal,
    required this.yamghantKaal,
  });

  final String day;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String vedicSunrise;
  final String vedicSunset;
  final Tithi tithi;
  final Nakshatra nakshatra;
  final Yog yog;
  final Karan karan;
  final HinduMaah hinduMaah;
  final String paksha;
  final String ritu;
  final String sunSign;
  final String moonSign;
  final String ayana;
  final String panchangYog;
  final int vikramSamvat;
  final int shakaSamvat;
  final String vkramSamvatName;
  final String shakaSamvatName;
  final String dishaShool;
  final String dishaShoolRemedies;
  final NakShool nakShool;
  final String moonNivas;
  final AbhijitMuhurta abhijitMuhurta;
  final AbhijitMuhurta rahukaal;
  final AbhijitMuhurta guliKaal;
  final AbhijitMuhurta yamghantKaal;

  factory Panchang.fromJson(String str) => Panchang.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Panchang.fromMap(Map<String, dynamic> json) => Panchang(
        day: json["day"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        vedicSunrise: json["vedic_sunrise"],
        vedicSunset: json["vedic_sunset"],
        tithi: Tithi.fromMap(json["tithi"]),
        nakshatra: Nakshatra.fromMap(json["nakshatra"]),
        yog: Yog.fromMap(json["yog"]),
        karan: Karan.fromMap(json["karan"]),
        hinduMaah: HinduMaah.fromMap(json["hindu_maah"]),
        paksha: json["paksha"],
        ritu: json["ritu"],
        sunSign: json["sun_sign"],
        moonSign: json["moon_sign"],
        ayana: json["ayana"],
        panchangYog: json["panchang_yog"],
        vikramSamvat: json["vikram_samvat"],
        shakaSamvat: json["shaka_samvat"],
        vkramSamvatName: json["vkram_samvat_name"],
        shakaSamvatName: json["shaka_samvat_name"],
        dishaShool: json["disha_shool"],
        dishaShoolRemedies: json["disha_shool_remedies"],
        nakShool: NakShool.fromMap(json["nak_shool"]),
        moonNivas: json["moon_nivas"],
        abhijitMuhurta: AbhijitMuhurta.fromMap(json["abhijit_muhurta"]),
        rahukaal: AbhijitMuhurta.fromMap(json["rahukaal"]),
        guliKaal: AbhijitMuhurta.fromMap(json["guliKaal"]),
        yamghantKaal: AbhijitMuhurta.fromMap(json["yamghant_kaal"]),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "vedic_sunrise": vedicSunrise,
        "vedic_sunset": vedicSunset,
        "tithi": tithi.toMap(),
        "nakshatra": nakshatra.toMap(),
        "yog": yog.toMap(),
        "karan": karan.toMap(),
        "hindu_maah": hinduMaah.toMap(),
        "paksha": paksha,
        "ritu": ritu,
        "sun_sign": sunSign,
        "moon_sign": moonSign,
        "ayana": ayana,
        "panchang_yog": panchangYog,
        "vikram_samvat": vikramSamvat,
        "shaka_samvat": shakaSamvat,
        "vkram_samvat_name": vkramSamvatName,
        "shaka_samvat_name": shakaSamvatName,
        "disha_shool": dishaShool,
        "disha_shool_remedies": dishaShoolRemedies,
        "nak_shool": nakShool.toMap(),
        "moon_nivas": moonNivas,
        "abhijit_muhurta": abhijitMuhurta.toMap(),
        "rahukaal": rahukaal.toMap(),
        "guliKaal": guliKaal.toMap(),
        "yamghant_kaal": yamghantKaal.toMap(),
      };
}

class AbhijitMuhurta {
  AbhijitMuhurta({
    required this.start,
    required this.end,
  });

  final String start;
  final String end;

  factory AbhijitMuhurta.fromJson(String str) =>
      AbhijitMuhurta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbhijitMuhurta.fromMap(Map<String, dynamic> json) => AbhijitMuhurta(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toMap() => {
        "start": start,
        "end": end,
      };
}

class HinduMaah {
  HinduMaah({
    required this.adhikStatus,
    required this.purnimanta,
    required this.amanta,
    required this.amantaId,
    required this.purnimantaId,
  });

  final bool adhikStatus;
  final String purnimanta;
  final String amanta;
  final int amantaId;
  final int purnimantaId;

  factory HinduMaah.fromJson(String str) => HinduMaah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HinduMaah.fromMap(Map<String, dynamic> json) => HinduMaah(
        adhikStatus: json["adhik_status"],
        purnimanta: json["purnimanta"],
        amanta: json["amanta"],
        amantaId: json["amanta_id"],
        purnimantaId: json["purnimanta_id"],
      );

  Map<String, dynamic> toMap() => {
        "adhik_status": adhikStatus,
        "purnimanta": purnimanta,
        "amanta": amanta,
        "amanta_id": amantaId,
        "purnimanta_id": purnimantaId,
      };
}

class Karan {
  Karan({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  final KaranDetails details;
  final EndTime endTime;
  final int endTimeMs;

  factory Karan.fromJson(String str) => Karan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Karan.fromMap(Map<String, dynamic> json) => Karan(
        details: KaranDetails.fromMap(json["details"]),
        endTime: EndTime.fromMap(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toMap() => {
        "details": details.toMap(),
        "end_time": endTime.toMap(),
        "end_time_ms": endTimeMs,
      };
}

class KaranDetails {
  KaranDetails({
    required this.karanNumber,
    required this.karanName,
    required this.special,
    required this.deity,
  });

  final int karanNumber;
  final String karanName;
  final String special;
  final String deity;

  factory KaranDetails.fromJson(String str) =>
      KaranDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KaranDetails.fromMap(Map<String, dynamic> json) => KaranDetails(
        karanNumber: json["karan_number"],
        karanName: json["karan_name"],
        special: json["special"],
        deity: json["deity"],
      );

  Map<String, dynamic> toMap() => {
        "karan_number": karanNumber,
        "karan_name": karanName,
        "special": special,
        "deity": deity,
      };
}

class EndTime {
  EndTime({
    required this.hour,
    required this.minute,
    required this.second,
  });

  final int hour;
  final int minute;
  final int second;

  factory EndTime.fromJson(String str) => EndTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EndTime.fromMap(Map<String, dynamic> json) => EndTime(
        hour: json["hour"],
        minute: json["minute"],
        second: json["second"],
      );

  Map<String, dynamic> toMap() => {
        "hour": hour,
        "minute": minute,
        "second": second,
      };
}

class NakShool {
  NakShool({
    required this.direction,
    required this.remedies,
  });

  final String direction;
  final String remedies;

  factory NakShool.fromJson(String str) => NakShool.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NakShool.fromMap(Map<String, dynamic> json) => NakShool(
        direction: json["direction"],
        remedies: json["remedies"],
      );

  Map<String, dynamic> toMap() => {
        "direction": direction,
        "remedies": remedies,
      };
}

class Nakshatra {
  Nakshatra({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  final NakshatraDetails details;
  final EndTime endTime;
  final int endTimeMs;

  factory Nakshatra.fromJson(String str) => Nakshatra.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nakshatra.fromMap(Map<String, dynamic> json) => Nakshatra(
        details: NakshatraDetails.fromMap(json["details"]),
        endTime: EndTime.fromMap(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toMap() => {
        "details": details.toMap(),
        "end_time": endTime.toMap(),
        "end_time_ms": endTimeMs,
      };
}

class NakshatraDetails {
  NakshatraDetails({
    required this.nakNumber,
    required this.nakName,
    required this.ruler,
    required this.deity,
    required this.special,
    required this.summary,
  });

  final int nakNumber;
  final String nakName;
  final String ruler;
  final String deity;
  final String special;
  final String summary;

  factory NakshatraDetails.fromJson(String str) =>
      NakshatraDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NakshatraDetails.fromMap(Map<String, dynamic> json) =>
      NakshatraDetails(
        nakNumber: json["nak_number"],
        nakName: json["nak_name"],
        ruler: json["ruler"],
        deity: json["deity"],
        special: json["special"],
        summary: json["summary"],
      );

  Map<String, dynamic> toMap() => {
        "nak_number": nakNumber,
        "nak_name": nakName,
        "ruler": ruler,
        "deity": deity,
        "special": special,
        "summary": summary,
      };
}

class Tithi {
  Tithi({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  final TithiDetails details;
  final EndTime endTime;
  final int endTimeMs;

  factory Tithi.fromJson(String str) => Tithi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tithi.fromMap(Map<String, dynamic> json) => Tithi(
        details: TithiDetails.fromMap(json["details"]),
        endTime: EndTime.fromMap(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toMap() => {
        "details": details.toMap(),
        "end_time": endTime.toMap(),
        "end_time_ms": endTimeMs,
      };
}

class TithiDetails {
  TithiDetails({
    required this.tithiNumber,
    required this.tithiName,
    required this.special,
    required this.summary,
    required this.deity,
  });

  final int tithiNumber;
  final String tithiName;
  final String special;
  final String summary;
  final String deity;

  factory TithiDetails.fromJson(String str) =>
      TithiDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TithiDetails.fromMap(Map<String, dynamic> json) => TithiDetails(
        tithiNumber: json["tithi_number"],
        tithiName: json["tithi_name"],
        special: json["special"],
        summary: json["summary"],
        deity: json["deity"],
      );

  Map<String, dynamic> toMap() => {
        "tithi_number": tithiNumber,
        "tithi_name": tithiName,
        "special": special,
        "summary": summary,
        "deity": deity,
      };
}

class Yog {
  Yog({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  final YogDetails details;
  final EndTime endTime;
  final int endTimeMs;

  factory Yog.fromJson(String str) => Yog.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Yog.fromMap(Map<String, dynamic> json) => Yog(
        details: YogDetails.fromMap(json["details"]),
        endTime: EndTime.fromMap(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toMap() => {
        "details": details.toMap(),
        "end_time": endTime.toMap(),
        "end_time_ms": endTimeMs,
      };
}

class YogDetails {
  YogDetails({
    required this.yogNumber,
    required this.yogName,
    required this.special,
    required this.meaning,
  });

  final int yogNumber;
  final String yogName;
  final String special;
  final String meaning;

  factory YogDetails.fromJson(String str) =>
      YogDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YogDetails.fromMap(Map<String, dynamic> json) => YogDetails(
        yogNumber: json["yog_number"],
        yogName: json["yog_name"],
        special: json["special"],
        meaning: json["meaning"],
      );

  Map<String, dynamic> toMap() => {
        "yog_number": yogNumber,
        "yog_name": yogName,
        "special": special,
        "meaning": meaning,
      };
}
