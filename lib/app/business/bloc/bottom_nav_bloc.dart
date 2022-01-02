import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  int currentIndex = 0;
  BottomNavBloc() : super(CurrentIndexChanged(currentIndex: 0)) {
    on<BottomNavEvent>((event, emit) {
      // TODO: implement event handler
      if (event is PageTapped) {
        this.currentIndex = event.index;
        emit(CurrentIndexChanged(currentIndex: currentIndex));
      }
    });
  }
}
