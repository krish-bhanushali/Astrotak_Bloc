import 'package:astrotak/app/business/bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTithi extends StatelessWidget {
  const HomeTithi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  subTitle:
                      state.panchang!.tithi.details.tithiNumber.toString(),
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
                  subTitle:
                      state.panchang!.nakshatra.details.nakNumber.toString(),
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
          return Container(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Please select Date and Location'),
                ),
              ],
            ),
          );
        },
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
