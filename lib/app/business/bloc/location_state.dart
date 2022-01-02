part of 'location_bloc.dart';

abstract class LocationState extends Equatable {}

class LocationInitial extends LocationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LocationSearch extends LocationState {
  final List<Location> locationSearchResults;

  LocationSearch({required this.locationSearchResults});

  @override
  // TODO: implement props
  List<Object?> get props => [locationSearchResults];
}

class LocationSearchComplete extends LocationState {
  final List<Location> locationSearchComplete;

  LocationSearchComplete({required this.locationSearchComplete});

  @override
  // TODO: implement props
  List<Object?> get props => [locationSearchComplete];
}

class LocationSelected extends LocationState {
  final Location location;

  LocationSelected({required this.location});

  @override
  // TODO: implement props
  List<Object?> get props => [location];
}

class PanchangInitial extends LocationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PanchangLoaded extends LocationState {
  final Panchang? panchang;
  final String? placeId;
  final DateTime? dateTime;

  PanchangLoaded(this.panchang, this.placeId, this.dateTime);

  @override
  // TODO: implement props
  List<Object?> get props => [panchang];
}
