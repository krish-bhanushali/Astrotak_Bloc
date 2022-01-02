part of 'astrologerbloc_bloc.dart';

abstract class AstrologerblocState extends Equatable {}

class AstrologerblocInitial extends AstrologerblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AstrologerblocEmpty extends AstrologerblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AstrologerblocLoading extends AstrologerblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AstrologerblocLoaded extends AstrologerblocState {
  final List<Astrologer> astroglogers;

  AstrologerblocLoaded({required this.astroglogers});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AstrologerblocError extends AstrologerblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AstrologerblocSearchStarted extends AstrologerblocState {
  final List<Astrologer> searchResults;

  AstrologerblocSearchStarted({required this.searchResults});

  @override
  List<Object> get props => [searchResults];
}

class AstrologerblocSorted extends AstrologerblocState {
  final List<Astrologer> sortedLogers;
  final sortType sort;

  AstrologerblocSorted({required this.sortedLogers, required this.sort});

  @override
  // TODO: implement props
  List<Object?> get props => [sortedLogers, sort];
}

class AstrologerBlocFilter extends AstrologerblocState {
  final List<Astrologer> filteredLogers;

  AstrologerBlocFilter({required this.filteredLogers});

  @override
  // TODO: implement props
  List<Object?> get props => [filteredLogers];
}

class AstrologerblocSearchEnded extends AstrologerblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
