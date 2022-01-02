import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/models/location_model.dart';
import 'package:astrotak/app/data/models/panchang_model.dart';
import 'package:astrotak/app/data/repositories/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

///[LocationBloc] It is a brain for home screen
///fetches panchang for date and location
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ApiRepository apiRepository;
  List<Location>? locations = [];
  Panchang? panchang;
  Location? selectedLocation;

  LocationBloc({required this.apiRepository}) : super(PanchangInitial()) {
    on<LocationEvent>((event, emit) async {
      // TODO: implement event handler

      ///Search location Event is triggered when user types in the location
      ///auto complete results are returned in the custom overlay
      if (event is SearchLocationEvent) {
        try {
          if (event.query.isNotEmpty) {
            if (locations!.isNotEmpty) {
              emit(LocationSearch(locationSearchResults: locations!));
            }
            final CustomResponse response =
                await apiRepository.searchLocation(event.query);
            print(response.data);
            if (response.status == Status.ERROR) {
              throw Exception(response.message);
            }
            locations = response.data;

            emit(LocationSearch(locationSearchResults: locations!));
          }
        } catch (e) {
          print(e);
          //add message later
          //  emit(AstrologerblocError());
        }
      }

      ///When user taps on the list of locations
      else if (event is SelectedLocationEvent) {
        print('got here');
        selectedLocation = event.location;
        emit(LocationSelected(location: event.location));
      }

      ///When fetching of Panchang starts
      else if (event is FetchPanchang) {
        try {
          final CustomResponse response = await apiRepository.getPanchang(
              event.placeId!,
              event.dateTimeofPanchang!.day,
              event.dateTimeofPanchang!.month,
              event.dateTimeofPanchang!.year);
          print(response.data);
          if (response.status == Status.ERROR) {
            throw Exception(response.message);
          }
          panchang = response.data;

          emit(PanchangLoaded(panchang, event.placeId!,
              event.dateTimeofPanchang, selectedLocation!.placeName));
        } catch (e) {
          print(e);
          //add message later
          //  emit(AstrologerblocError());
        }
      }
    });
  }
}
