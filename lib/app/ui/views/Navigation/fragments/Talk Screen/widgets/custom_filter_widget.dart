import 'package:astrotak/app/ui/values/color.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
    this.hindi = false,
    this.english = false,
    this.vastu = false,
    this.astrology = false,
    this.onTapHindi,
    this.onTapEnglish,
    this.onTapvastu,
    this.onTapastrology,
    this.applyFilters,
  }) : super(key: key);

  final bool hindi;
  final bool english;
  final bool vastu;
  final bool astrology;
  final Function()? onTapHindi;
  final Function()? onTapEnglish;
  final Function()? onTapvastu;
  final Function()? onTapastrology;

  final Function()? applyFilters;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Filter',
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text('Language'),
        ),
        Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                  onTap: onTapEnglish,
                  text: 'English',
                  icon: english
                      ? Icon(
                          Icons.radio_button_checked,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                  onTap: onTapHindi,
                  text: 'Hindi',
                  icon: hindi
                      ? Icon(
                          Icons.radio_button_checked,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                        ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text('Skills'),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                    onTap: onTapvastu,
                    text: 'Falit Jyotish',
                    icon: vastu
                        ? Icon(
                            Icons.radio_button_checked,
                          )
                        : Icon(
                            Icons.radio_button_unchecked,
                          )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                    onTap: onTapastrology,
                    text: 'Astrology',
                    icon: astrology
                        ? Icon(
                            Icons.radio_button_checked,
                          )
                        : Icon(
                            Icons.radio_button_unchecked,
                          )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: applyFilters,
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: AppColors.primaryColor,
              onSurface: Colors.white,
            ),
            child: Text('Apply'),
          ),
        ),
      ],
    );
  }
}

class CustomFilterTile extends StatelessWidget {
  const CustomFilterTile({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20.0,
          ),
          Center(
            child: Text(text),
          )
        ],
      ),
    );
  }
}
