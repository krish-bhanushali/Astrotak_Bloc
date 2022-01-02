import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/models/location_model.dart';
import 'package:astrotak/app/data/models/panchang_model.dart';
import 'package:astrotak/app/data/repositories/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ApiRepository apiRepository;
  List<Location>? locations = [];
  Panchang? panchang;

  LocationBloc({required this.apiRepository}) : super(PanchangInitial()) {
    on<LocationEvent>((event, emit) async {
      // TODO: implement event handler

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
      } else if (event is SelectedLocationEvent) {
        print('got here');
        emit(LocationSelected(location: event.location));
      } else if (event is FetchPanchang) {
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

          emit(PanchangLoaded(
              panchang, event.placeId!, event.dateTimeofPanchang));
        } catch (e) {
          print(e);
          //add message later
          //  emit(AstrologerblocError());
        }
      }
    });
  }
}
