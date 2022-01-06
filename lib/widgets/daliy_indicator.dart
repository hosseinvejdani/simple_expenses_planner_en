import 'package:flutter/material.dart';

import './precentage_bar_indicator.dart';

class DailyIndicator extends StatelessWidget {
  final String day;
  final int precentage;
  const DailyIndicator({required this.day, required this.precentage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$precentage%',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PrecentageBarIndicator(
            height: 90, width: 10, precentage: precentage / 100),
        Text(
          day,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
