import 'package:flutter/material.dart';
import './precentage_bar_indicator.dart';

class DailyIndicator extends StatelessWidget {
  final String day;
  final int precentage;
  const DailyIndicator({required this.day, required this.precentage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w / 10, // this control the single daily indicator size
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$precentage%',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
          PrecentageBarIndicator(
              height: 90, width: 15, precentage: precentage / 100),
          Text(
            day,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
