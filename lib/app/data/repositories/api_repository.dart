import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/models/location_model.dart';
import 'package:astrotak/app/data/models/panchang_model.dart';
import 'package:astrotak/app/services/api_service.dart';

class ApiRepository {
  final AstroApiService apiService;

  ApiRepository({required this.apiService});

  Future<CustomResponse> getAllAstrologers() async {
    return await apiService.getAllAstrologers();
  }

  Future<CustomResponse<List<Location>>> searchLocation(String query) async {
    return await apiService.searchLocation(query);
  }

  Future<CustomResponse<Panchang>> getPanchang(
      String placeid, day, month, year) async {
    return await apiService.getPanchang(placeid, day, month, year);
  }
}
