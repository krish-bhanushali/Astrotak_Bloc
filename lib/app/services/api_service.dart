import 'dart:convert';

import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/models/location_model.dart';
import 'package:astrotak/app/data/models/panchang_model.dart';
import 'package:dio/dio.dart';

class AstroApiService {
  static const baseUrl = 'https://www.astrotak.com';

  final Dio dioClient;

  AstroApiService({required this.dioClient});

  static final String astrologerUrl = 'astroapi/api/agent/all';

  Future<CustomResponse<List<Astrologer>>> getAllAstrologers() async {
    try {
      final requestResponse =
          await this.dioClient.get('$baseUrl/$astrologerUrl');

      return CustomResponse.completed((requestResponse.data['data'] as List)
          .map((e) => Astrologer.fromMap(e))
          .toList());
    } catch (E) {
      print(E);
      return CustomResponse.error(E);
    }
  }

  Future<CustomResponse<List<Location>>> searchLocation(String query) async {
    try {
      Response response =
          await dioClient.get('location/place?inputPlace=$query');
      return CustomResponse.completed((response.data['data'] as List)
          .map((e) => Location.fromMap(e))
          .toList());
    } on DioError catch (e) {
      print(e.response!.data);
      return CustomResponse.error('Api error');
    } catch (err) {
      print(err);
      return CustomResponse.error('Something went wrong');
    }
  }

  Future<CustomResponse<Panchang>> getPanchang(
      String placeid, day, month, year) async {
    try {
      Response response =
          await dioClient.post('horoscope/daily/panchang', data: {
        "day": day,
        "month": month,
        "year": year,
        "placeId": placeid,
      });
      print(response.data);
      return CustomResponse.completed(Panchang.fromMap(response.data['data']));
    } on DioError catch (e) {
      print(e.response!.data);
      return CustomResponse.error('Api error');
    } catch (err) {
      print(err);
      return CustomResponse.error('Something went wrong');
    }
  }
}
