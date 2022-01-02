import 'package:astrotak/app/business/bloc/location_bloc.dart';
import 'package:astrotak/app/ui/widgets/custom_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLocationSearchSuggestions extends StatelessWidget {
  const HomeLocationSearchSuggestions({
    Key? key,
    required this.searchEditingController,
    required this.dateTime,
  }) : super(key: key);

  final TextEditingController searchEditingController;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationSearch) {
          return OverlayContainer(
            show: true,
            position: OverlayContainerPosition(
              // Left position.
              -250,
              // Bottom position.
              -40,
            ),
            child: Container(
                width: 250,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400]!,
                        offset: Offset(0, 2),
                        blurRadius: 5)
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListView.separated(
                    padding: EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.locationSearchResults.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          searchEditingController.text =
                              state.locationSearchResults[index].placeName;
                          context.read<LocationBloc>().add(
                              SelectedLocationEvent(
                                  state.locationSearchResults[index]));
                          context.read<LocationBloc>().add(FetchPanchang(
                              dateTime,
                              state.locationSearchResults[index].placeId));
                        },
                        child:
                            Text(state.locationSearchResults[index].placeName),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                )),
          );
        } else {
          return Container();
        }
      },
    );
  }
}



  // Container(
                          //   height: 50,
                          //   width: 250,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //   ),
                          //   child: BlocBuilder<LocationBloc, LocationState>(
                          //     builder: (context, state) {
                          //       if (state is PanchangInitial) {
                          //         return Container(
                          //           child: TypeAheadField(
                          //             textFieldConfiguration:
                          //                 TextFieldConfiguration(
                          //               controller: searchEditingController,
                          //               decoration: InputDecoration(
                          //                 border: InputBorder.none,
                          //                 contentPadding:
                          //                     EdgeInsets.only(left: 16),
                          //               ),
                          //             ),
                          //             itemBuilder: (context, suggestion) {
                          //               Location location =
                          //                   suggestion as Location;

                          //               return Text(
                          //                 location.placeName,
                          //               );
                          //             },
                          //             onSuggestionSelected: (Object? suggestion) {
                          //               Location location =
                          //                   suggestion as Location;
                          //               searchEditingController.text =
                          //                   (suggestion as Location).placeName;

                          //               context
                          //                   .read<LocationBloc>()
                          //                   .add(SelectedLocationEvent(location));
                          //               context.read<LocationBloc>().add(
                          //                   FetchPanchang(
                          //                       dateTime, location.placeId));
                          //             },
                          //             suggestionsCallback: (pattern) async {
                          //               context
                          //                   .read<LocationBloc>()
                          //                   .add(SearchLocationEvent(pattern));

                          //               return [];
                          //             },
                          //           ),
                          //         );
                          //       } else if (state is LocationSearch) {
                          //         return Container(
                          //           child: TypeAheadField(
                          //             textFieldConfiguration:
                          //                 TextFieldConfiguration(
                          //               controller: searchEditingController,
                          //               decoration: InputDecoration(
                          //                 border: InputBorder.none,
                          //                 contentPadding:
                          //                     EdgeInsets.only(left: 16),
                          //               ),
                          //             ),
                          //             itemBuilder: (context, suggestion) {
                          //               Location location =
                          //                   suggestion as Location;

                          //               return Text(
                          //                 location.placeName,
                          //               );
                          //             },
                          //             onSuggestionSelected: (Object? suggestion) {
                          //               Location location =
                          //                   suggestion as Location;
                          //               searchEditingController.text =
                          //                   (suggestion as Location).placeName;

                          //               context
                          //                   .read<LocationBloc>()
                          //                   .add(SelectedLocationEvent(location));
                          //               context.read<LocationBloc>().add(
                          //                   FetchPanchang(
                          //                       dateTime, location.placeId));
                          //             },
                          //             suggestionsCallback: (pattern) async {
                          //               context
                          //                   .read<LocationBloc>()
                          //                   .add(SearchLocationEvent(pattern));

                          //               return state.locationSearchResults;
                          //             },
                          //           ),
                          //         );
                          //       } else if (state is PanchangLoaded) {
                          //         return Container(
                          //           child: TypeAheadField(
                          //             textFieldConfiguration:
                          //                 TextFieldConfiguration(
                          //               controller: searchEditingController,
                          //               decoration: InputDecoration(
                          //                 border: InputBorder.none,
                          //                 contentPadding:
                          //                     EdgeInsets.only(left: 16),
                          //               ),
                          //             ),
                          //             itemBuilder: (context, suggestion) {
                          //               Location location =
                          //                   suggestion as Location;
                          //               return Text(
                          //                 location.placeName,
                          //               );
                          //             },
                          //             onSuggestionSelected:
                          //                 (Object? suggestion) {},
                          //             suggestionsCallback: (pattern) async {
                          //               context
                          //                   .read<LocationBloc>()
                          //                   .add(SearchLocationEvent(pattern));

                          //               return [];
                          //             },
                          //           ),
                          //         );
                          //       }
                          //       return Container();
                          //     },
                          //   ),
                          // ),