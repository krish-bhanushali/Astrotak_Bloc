import 'package:astrotak/app/business/bloc/location_bloc.dart';
import 'package:astrotak/app/data/models/location_model.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchEditingController = TextEditingController();

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.menu),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            print('Hamburger');
          },
          child: Image.asset(
            'assets/hamburger.png',
          ),
        ),
        title: Image.asset(
          'assets/logo.png',
          scale: 4.7,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print('Profile');
            },
            child: Image.asset(
              'assets/profile.png',
              scale: 3.6,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    'Daily Panchang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'India is a country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates we bring you the daily panchang.',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 166,
                color: AppColors.lightOrange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'Date:',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, state) {
                          if (state is PanchangLoaded) {
                            return Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: DateTimePicker(
                                onChanged: (value) {
                                  print(value);
                                  dateTime = DateTime.parse(value);
                                },
                                dateMask: 'd MMMM yyyy',
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 16, top: 16),
                                  border: InputBorder.none,
                                ),
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ),
                            );
                          }
                          return Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: DateTimePicker(
                              fieldHintText: 'Select Date',
                              onChanged: (value) {
                                print(value);
                                dateTime = DateTime.parse(value);
                              },
                              dateMask: 'd MMMM yyyy',
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 16, top: 16),
                                border: InputBorder.none,
                              ),
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            ),
                          );
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'Location:',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, state) {
                              if (state is PanchangInitial) {
                                return Container(
                                  child: TypeAheadField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      controller: searchEditingController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 16),
                                      ),
                                    ),
                                    itemBuilder: (context, suggestion) {
                                      Location location =
                                          suggestion as Location;

                                      return Text(
                                        location.placeName,
                                      );
                                    },
                                    onSuggestionSelected: (Object? suggestion) {
                                      Location location =
                                          suggestion as Location;
                                      searchEditingController.text =
                                          (suggestion as Location).placeName;

                                      context
                                          .read<LocationBloc>()
                                          .add(SelectedLocationEvent(location));
                                      context.read<LocationBloc>().add(
                                          FetchPanchang(
                                              dateTime, location.placeId));
                                    },
                                    suggestionsCallback: (pattern) async {
                                      context
                                          .read<LocationBloc>()
                                          .add(SearchLocationEvent(pattern));

                                      return [];
                                    },
                                  ),
                                );
                              } else if (state is LocationSearch) {
                                return Container(
                                  child: TypeAheadField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      controller: searchEditingController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 16),
                                      ),
                                    ),
                                    itemBuilder: (context, suggestion) {
                                      Location location =
                                          suggestion as Location;

                                      return Text(
                                        location.placeName,
                                      );
                                    },
                                    onSuggestionSelected: (Object? suggestion) {
                                      Location location =
                                          suggestion as Location;
                                      searchEditingController.text =
                                          (suggestion as Location).placeName;

                                      context
                                          .read<LocationBloc>()
                                          .add(SelectedLocationEvent(location));
                                      context.read<LocationBloc>().add(
                                          FetchPanchang(
                                              dateTime, location.placeId));
                                    },
                                    suggestionsCallback: (pattern) async {
                                      context
                                          .read<LocationBloc>()
                                          .add(SearchLocationEvent(pattern));

                                      return state.locationSearchResults;
                                    },
                                  ),
                                );
                              } else if (state is PanchangLoaded) {
                                return Container(
                                  child: TypeAheadField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      controller: searchEditingController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 16),
                                      ),
                                    ),
                                    itemBuilder: (context, suggestion) {
                                      Location location =
                                          suggestion as Location;
                                      return Text(
                                        location.placeName,
                                      );
                                    },
                                    onSuggestionSelected:
                                        (Object? suggestion) {},
                                    suggestionsCallback: (pattern) async {
                                      context
                                          .read<LocationBloc>()
                                          .add(SearchLocationEvent(pattern));

                                      return [];
                                    },
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    if (state is PanchangLoaded) {
                      return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: 14),
                          Text(
                            'Tithi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TithiTile(
                            title: 'Tithi Number:',
                            subTitle: state.panchang!.tithi.details.tithiNumber
                                .toString(),
                          ),
                          TithiTile(
                            title: 'Tithi Name:',
                            subTitle: state.panchang!.tithi.details.tithiName,
                          ),
                          TithiTile(
                            title: 'Special:',
                            subTitle: state.panchang!.tithi.details.special,
                          ),
                          TithiTile(
                            title: 'Summary:',
                            subTitle: state.panchang!.tithi.details.summary,
                          ),
                          TithiTile(
                            title: 'Deity:',
                            subTitle: state.panchang!.tithi.details.deity,
                          ),
                          TithiTile(
                            title: 'End Time:',
                            subTitle:
                                '${state.panchang!.tithi.endTime.hour} hr ${state.panchang!.tithi.endTime.minute} min ${state.panchang!.tithi.endTime.second} sec',
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Nakshatra',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TithiTile(
                            title: 'Nakshatra Number:',
                            subTitle: state
                                .panchang!.nakshatra.details.nakNumber
                                .toString(),
                          ),
                          TithiTile(
                            title: 'Nakshatra Name:',
                            subTitle: state.panchang!.nakshatra.details.nakName,
                          ),
                          TithiTile(
                            title: 'Ruler:',
                            subTitle: state.panchang!.nakshatra.details.ruler,
                          ),
                          TithiTile(
                            title: 'Summary:',
                            subTitle: state.panchang!.nakshatra.details.summary,
                          ),
                          TithiTile(
                            title: 'Deity:',
                            subTitle: state.panchang!.nakshatra.details.deity,
                          ),
                          TithiTile(
                            title: 'End Time:',
                            subTitle:
                                '${state.panchang!.nakshatra.endTime.hour} hr ${state.panchang!.nakshatra.endTime.minute} min ${state.panchang!.nakshatra.endTime.second} sec',
                          )
                        ],
                      );
                    }
                    return Center(
                      child: Text('Please select Date and Location'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TithiTile extends StatelessWidget {
  const TithiTile({
    required this.subTitle,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              subTitle,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
