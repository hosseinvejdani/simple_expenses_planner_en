import 'package:flutter/material.dart';

import './precentage_bar_indicator.dart';

class DailyIndicator extends StatelessWidget {
  const DailyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '70%',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PrecentageBarIndicator(height: 90, width: 10, precentage: 0.7),
        Text(
          'Sat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
