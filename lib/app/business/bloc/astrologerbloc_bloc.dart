import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/data/models/custom_response.dart';
import 'package:astrotak/app/data/repositories/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'astrologerbloc_event.dart';
part 'astrologerbloc_state.dart';

///[AstrologerblocBloc] It is a brain for our talk to screen
///performs all types of logics on events
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
      ///Fetch Event On Screen Creation
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
      }

      ///Search Event when Search Icon is clicked and user types
      else if (event is SearchEvent) {
        if (event.query.isEmpty) {
          emit(AstrologerblocSearchStarted(searchResults: astrologers!));
        }

        ///filtering astrologers
        filteredAstrologers = astrologers!.where((astrologer) {
          bool isSkill = false;
          bool isLanguage = false;

          ///searching by typing of skills
          astrologer.skills.forEach((element) {
            if (element.name
                .toLowerCase()
                .contains(event.query.toLowerCase())) {
              isSkill = true;
            }
          });

          ///searching by typing of languages
          astrologer.languages.forEach((element) {
            if (element.name
                .toLowerCase()
                .contains(event.query.toLowerCase())) {
              isLanguage = true;
            }
          });

          //searching by name
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
      }

      ///To load astrologers and hide the searchbar
      else if (event is SearchCompeteEvent) {
        emit(AstrologerblocSearchEnded());
        emit(AstrologerblocLoaded(astroglogers: astrologers!));
      }

      ///When we click on sort overlay buttons
      else if (event is SortEvent) {
        print('here');
        sortedAstrologers = astrologers;

        ///takes on sorting type and sorts the list according to it
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
      }

      ///Filters the data from given filters
      ///ASSUMPTIONS ARE MADE AS API DOESNT PROVIDE THE LIST OF FILTERS STATIC FILTERS
      ///ARE ASSUMED

      else if (event is FilterEvent) {
        print('filter trigger');
        applyFilteredAstrologers = astrologers!.where((astrologer) {
          bool isLanguage = false;
          bool isSkill = false;

          ///Check for language filter
          if (event.languageFilter!.isNotEmpty) {
            astrologer.languages.forEach((element) {
              event.languageFilter!.forEach((filter) {
                if (element.name.toLowerCase().contains(filter.toLowerCase())) {
                  isLanguage = true;
                  print('uyes');
                }
              });
            });
          } else {
            isLanguage = true;
          }

          /// check for skill filter
          if (event.skills!.isNotEmpty) {
            astrologer.skills.forEach((element) {
              event.skills!.forEach((filter) {
                if (element.name.toLowerCase().contains(filter.toLowerCase())) {
                  isSkill = true;
                  print('byes');
                }
              });
            });
          } else {
            isSkill = true;
          }
          if (isSkill && isLanguage) {
            return true;
          } else {
            return false;
          }
        }).toList();

        emit(AstrologerBlocFilter(filteredLogers: applyFilteredAstrologers!));
      }
    });
  }
}
