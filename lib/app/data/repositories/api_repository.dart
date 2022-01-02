import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/models/location_model.dart';
import 'package:astrotak/app/data/models/panchang_model.dart';
import 'package:astrotak/app/services/api_service.dart';

///[ApiRepository] It is a container layer of our app that communicates
///with bloc and our client
///consists of all the api clients at a more abstract level
///you need to know what actually happens under the hood
class ApiRepository {
  final AstroApiService apiService;

  ApiRepository({required this.apiService});

  ///[getAllAstrologers] fetchesAllAstrologers
  Future<CustomResponse> getAllAstrologers() async {
    return await apiService.getAllAstrologers();
  }

  ///[searchLocation]  returns List of location from search queries
  Future<CustomResponse<List<Location>>> searchLocation(String query) async {
    return await apiService.searchLocation(query);
  }

  ///[getPanchang]  returns Panchag
  Future<CustomResponse<Panchang>> getPanchang(
      String placeid, day, month, year) async {
    return await apiService.getPanchang(placeid, day, month, year);
  }
}
