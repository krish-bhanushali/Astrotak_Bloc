part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class SearchLocationEvent extends LocationEvent {
  final String query;

  SearchLocationEvent(this.query);
}

class SelectedLocationEvent extends LocationEvent {
  final Location location;
  SelectedLocationEvent(this.location);
}

class FetchPanchang extends LocationEvent {
  final DateTime? dateTimeofPanchang;
  final String? placeId;

  FetchPanchang(this.dateTimeofPanchang, this.placeId);
}
