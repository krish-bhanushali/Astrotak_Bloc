part of 'astrologerbloc_bloc.dart';

abstract class AstrologerblocEvent extends Equatable {
  const AstrologerblocEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends AstrologerblocEvent {}

enum sortType {
  experienceLowtoHigh,
  experienceHightoLow,
  priceLowToHigh,
  priceHighToLow
}

class SortEvent extends AstrologerblocEvent {
  final sortType? sorting;

  SortEvent(this.sorting);
}

class FilterEvent extends AstrologerblocEvent {
  final List<String>? languageFilter;
  final List<String>? skills;

  FilterEvent(this.languageFilter, this.skills);
}

class SearchEvent extends AstrologerblocEvent {
  final String query;

  SearchEvent(this.query);
}

class SearchCompeteEvent extends AstrologerblocEvent {}
