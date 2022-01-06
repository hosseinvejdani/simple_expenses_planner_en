import 'package:flutter/material.dart';

import './daliy_indicator.dart';

class LastWeekChartBox extends StatelessWidget {
  const LastWeekChartBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Text(
            'Last 7 Days : \$1260',
            style: TextStyle(
                color: Colors.purple[800],
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Quicksand'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DailyIndicator(),
            DailyIndicator(),
            DailyIndicator(),
            DailyIndicator(),
            DailyIndicator(),
            DailyIndicator(),
            DailyIndicator(),
          ],
        ),
      ],
    );
  }
}
