part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();
}

class PageTapped extends BottomNavEvent {
  final int index;

  PageTapped({required this.index});

  @override
  String toString() => 'PageTapped: $index';

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
