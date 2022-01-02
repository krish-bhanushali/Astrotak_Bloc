import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
