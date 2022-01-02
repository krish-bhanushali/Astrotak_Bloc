import 'package:astrotak/app/business/bloc/location_bloc.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:astrotak/app/ui/views/Navigation/fragments/Home%20Screen/widgets/home_tithi_widget.dart';
import 'package:astrotak/app/ui/views/Navigation/fragments/Home%20Screen/widgets/home_title_widget.dart';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_location_suggestion_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitleWidget(),
              SizedBox(height: 16),
              Container(
                height: 166,
                color: AppColors.lightOrange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          HomeDatePickerWidget(onChanged: (value) {
                            dateTime = DateTime.parse(value);
                          })
                        ],
                      ),
                    ),
                    HomeLocationTextField(
                        searchEditingController: searchEditingController,
                        dateTime: dateTime),
                  ],
                ),
              ),
              HomeTithi()
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDatePickerWidget extends StatelessWidget {
  final void Function(String)? onChanged;

  const HomeDatePickerWidget({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
      if (state is PanchangLoaded) {
        return Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: DateTimePicker(
            initialValue: DateTime.now().toString(),
            onChanged: onChanged,
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
              contentPadding: EdgeInsets.only(left: 16, top: 16),
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
          initialValue: DateTime.now().toString(),
          onChanged: onChanged,
          dateMask: 'd MMMM yyyy',
          decoration: InputDecoration(
            hintText: 'Select Date',
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            labelStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.only(left: 16, top: 16),
            border: InputBorder.none,
          ),
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ),
      );
    });
  }
}

class HomeLocationTextField extends StatelessWidget {
  const HomeLocationTextField({
    Key? key,
    required this.searchEditingController,
    required this.dateTime,
  }) : super(key: key);

  final TextEditingController searchEditingController;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    child: TextField(
                      controller: searchEditingController,
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16),
                      ),
                      onChanged: (pattern) async {
                        context
                            .read<LocationBloc>()
                            .add(SearchLocationEvent(pattern));
                      },
                    ),
                  );
                } else if (state is LocationSearch) {
                  return Container(
                    child: TextField(
                      controller: searchEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16),
                      ),
                      onChanged: (pattern) async {
                        context
                            .read<LocationBloc>()
                            .add(SearchLocationEvent(pattern));
                      },
                    ),
                  );
                } else if (state is PanchangLoaded) {
                  searchEditingController.text = state.placeName!;
                  return Container(
                    child: TextField(
                      controller: searchEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16),
                      ),
                      onChanged: (pattern) async {
                        context
                            .read<LocationBloc>()
                            .add(SearchLocationEvent(pattern));
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          HomeLocationSearchSuggestions(
              searchEditingController: searchEditingController,
              dateTime: dateTime),
        ],
      ),
    );
  }
}
