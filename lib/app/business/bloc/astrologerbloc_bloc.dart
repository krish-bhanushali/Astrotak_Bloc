import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/repositories/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'astrologerbloc_event.dart';
part 'astrologerbloc_state.dart';

class AstrologerblocBloc
    extends Bloc<AstrologerblocEvent, AstrologerblocState> {
  final ApiRepository apiRepository;
  List<Astrologer>? astrologers;
  List<Astrologer>? filteredAstrologers;
  List<Astrologer>? sortedAstrologers;

  List<Astrologer>? applyFilteredAstrologers;

  AstrologerblocBloc({required this.apiRepository})
      : super(AstrologerblocEmpty()) {
    on<AstrologerblocEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is FetchEvent) {
        emit(AstrologerblocLoading());
        try {
          final CustomResponse response =
              await apiRepository.getAllAstrologers();
          print(response.data);
          if (response.status == Status.ERROR) {
            throw Exception(response.message);
          }
          astrologers = response.data;

          emit(AstrologerblocLoaded(astroglogers: astrologers!));
        } catch (e) {
          print(e);
          //add message later
          emit(AstrologerblocError());
        }
      } else if (event is SearchEvent) {
        if (event.query.isEmpty) {
          emit(AstrologerblocSearchStarted(searchResults: astrologers!));
        }

        filteredAstrologers = astrologers!.where((astrologer) {
          bool isSkill = false;
          bool isLanguage = false;
          astrologer.skills.forEach((element) {
            if (element.name
                .toLowerCase()
                .contains(event.query.toLowerCase())) {
              isSkill = true;
            }
          });

          astrologer.languages.forEach((element) {
            if (element.name
                .toLowerCase()
                .contains(event.query.toLowerCase())) {
              isLanguage = true;
            }
          });

          if ((astrologer.firstName.toLowerCase() +
                      " " +
                      astrologer.lastName.toLowerCase())
                  .contains(event.query.toLowerCase()) ||
              isSkill ||
              isLanguage) {
            return true;
          } else {
            return false;
          }
        }).toList();

        emit(AstrologerblocSearchStarted(searchResults: filteredAstrologers!));
      } else if (event is SearchCompeteEvent) {
        emit(AstrologerblocSearchEnded());
        emit(AstrologerblocLoaded(astroglogers: astrologers!));
      } else if (event is SortEvent) {
        print('here');
        sortedAstrologers = astrologers;

        switch (event.sorting) {
          case sortType.experienceLowtoHigh:
            sortedAstrologers!
                .sort((a, b) => a.experience.compareTo(b.experience));

            break;
          case sortType.experienceHightoLow:
            sortedAstrologers!
                .sort((a, b) => b.experience.compareTo(a.experience));
            break;
          case sortType.priceLowToHigh:
            sortedAstrologers!.sort((a, b) => a.minimumCallDurationCharges
                .compareTo(b.minimumCallDurationCharges));
            break;
          case sortType.priceHighToLow:
            sortedAstrologers!.sort((a, b) => b.minimumCallDurationCharges
                .compareTo(a.minimumCallDurationCharges));
            break;

          default:
        }
        emit(AstrologerblocSorted(
            sortedLogers: sortedAstrologers!, sort: event.sorting!));
      } else if (event is FilterEvent) {
        applyFilteredAstrologers = astrologers!.where((astrologer) {
          bool isLanguage = false;
          bool isSkill = false;

          if (event.languageFilter!.isNotEmpty) {
            astrologer.languages.forEach((element) {
              event.languageFilter!.forEach((element) {});
            });
          }
        }).toList();
      }
    });
  }

  //later implement other functions
}
