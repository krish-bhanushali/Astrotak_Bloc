import 'package:astrotak/app/business/bloc/astrologerbloc_bloc.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingWidget extends StatelessWidget {
  const SortingWidget({
    Key? key,
    this.isElowtoHigh = false,
    this.isEhightoLow = false,
    this.isPhightoLow = false,
    this.isPlowtoHigh = false,
  }) : super(key: key);

  final bool isElowtoHigh;
  final bool isEhightoLow;
  final bool isPhightoLow;
  final bool isPlowtoHigh;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Sort By',
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
      children: [
        SimpleDialogOption(
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.experienceHightoLow));
            },
            leading: isEhightoLow
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
            title: Text('Experience -  High to Low'),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {},
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.experienceLowtoHigh));
            },
            title: Text(
              'Experience -  Low to High',
            ),
            leading: isElowtoHigh
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
          ),
        ),
        SimpleDialogOption(
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.priceHighToLow));
            },
            title: Text('Price -  High to Low'),
            leading: isPhightoLow
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
          ),
        ),
        SimpleDialogOption(
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.priceLowToHigh));
            },
            leading: isPlowtoHigh
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
            title: Text('Price -  Low to High'),
          ),
        ),
      ],
    );
  }
}
