import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './daliy_indicator.dart';

class LastWeekChartBox extends StatelessWidget {
  final List transactions;
  const LastWeekChartBox({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  num _valueSum(tx) {
    return tx.fold(
      0,
      (previous, current) => previous + current.value,
    );
  }

  Map get _last7Days {
    Map _result = {};
    String _day;

    for (int d = 0; d < 7; d++) {
      _day = DateFormat.E().format(DateTime.now().subtract(Duration(days: d)));
      _result[_day] = 0.0;
    }
    _result.keys.toList().forEach((day) {
      _result[day] = _valueSum(transactions.where((tx) {
        return DateFormat.E().format(tx.date) == day;
      }).toList());
    });
    return _result;
  }

  @override
  Widget build(BuildContext context) {
    final totalValue = _valueSum(transactions);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Text(
            'Last 7 Days : \$$totalValue',
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
            ...(_last7Days.keys.toList().map((day) {
              final int precentage = totalValue > 0
                  ? (100 * _last7Days[day] / totalValue).round()
                  : 0;
              return DailyIndicator(day: day, precentage: precentage);
            }).toList()),
          ],
        ),
      ],
    );
  }
}
