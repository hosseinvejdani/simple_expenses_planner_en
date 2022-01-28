import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class HomeController extends GetxController {
  List transactions = <Transaction>[].obs;

  void addNewTransaction(Map data) {
    Transaction newTx = Transaction(
      id: data['date'].toString(),
      title: data['title'],
      value: data['value'],
      date: data['date'],
    );

    transactions.add(newTx);

    if (transactions.length > 1) {
      transactions.sort((tx1, tx2) => tx2.date.compareTo(tx1.date));
    }

    Get.back();
  }

  void cancleAddingNewTransaction() {
    Get.back();
  }

  void deleteTransaction(String id) {
    transactions.removeWhere((element) {
      return element.id == id;
    });
  }

  List get recentTransactions {
    return transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  num valueSum(tx) {
    return tx.fold(
      0,
      (previous, current) => previous + current.value,
    );
  }

  num get totalValue => valueSum(recentTransactions);

  // getter for last 7 days expense in Map format
  Map get last7Days {
    Map _result = {};
    String _day;

    // extract last 7 day week days
    for (int d = 6; d >= 0; d--) {
      _day = DateFormat.E().format(DateTime.now().subtract(Duration(days: d)));
      _result[_day] = 0.0;
    }
    //calculate expenses for each day in last 7 days
    for (var day in _result.keys) {
      _result[day] = valueSum(recentTransactions.where((tx) {
        return DateFormat.E().format(tx.date) == day;
      }).toList());
    }
    return _result;
  }
}
