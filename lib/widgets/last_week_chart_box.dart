import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../screens/home_controller.dart';

import './daliy_indicator.dart';

class LastWeekChartBox extends StatelessWidget {
  final double height;
  LastWeekChartBox({
    Key? key,
    required this.height,
  }) : super(key: key);

  final homeController = Get.find<HomeController>();

  num _valueSum(tx) {
    return tx.fold(
      0,
      (previous, current) => previous + current.value,
    );
  }

  // getter for last 7 days expense in Map format
  Map get _last7Days {
    Map _result = {};
    String _day;

    // extract last 7 day week days
    for (int d = 6; d >= 0; d--) {
      _day = DateFormat.E().format(DateTime.now().subtract(Duration(days: d)));
      _result[_day] = 0.0;
    }
    //calculate expenses for each day in last 7 days
    for (var day in _result.keys) {
      _result[day] = _valueSum(homeController.recentTransactions.where((tx) {
        return DateFormat.E().format(tx.date) == day;
      }).toList());
    }
    return _result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 7, bottom: 10),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor.withOpacity(0.2)),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Obx(() => Text(
                    'Last 7 Days : \$${homeController.totalValue}',
                    style: TextStyle(
                        color: Colors.purple[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Quicksand'),
                  )),
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...(_last7Days.keys.toList().map((day) {
                      final int precentage = homeController.totalValue > 0
                          ? (100 *
                                  homeController.last7Days[day] /
                                  homeController.totalValue)
                              .round()
                          : 0;
                      return DailyIndicator(day: day, precentage: precentage);
                    }).toList()),
                  ],
                )),
          ],
        ),
        elevation: 5,
      ),
    );
  }
}
