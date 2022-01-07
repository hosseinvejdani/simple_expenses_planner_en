import 'package:flutter/material.dart';
import './transactions_list.dart';
import './last_week_chart_box.dart';
import './new_transaction_form.dart';
import './no_transaction_added.dart';
import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _transactions = <Transaction>[];

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransactionForm(
          newTransactionHandler: _addNewTransaction,
          cancleButtonHandler: _cancleAddingNewTransaction,
        );
      },
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
    );
  }

  void _addNewTransaction(Map data) {
    Transaction newTx = Transaction(
      id: data['date'].toString(),
      title: data['title'],
      value: data['value'],
      date: data['date'],
    );
    setState(() {
      _transactions.add(newTx);
    });
    Navigator.of(context).pop();
  }

  void _cancleAddingNewTransaction() {
    Navigator.of(context).pop();
  }

  void _deleteHandler(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  List get _recentTransactions {
    return _transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _boxChartHeight = 0.30 * _height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Expenses',
        ),
        actions: [
          IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LastWeekChartBox(
              transactions: _recentTransactions,
              height: _boxChartHeight,
            ),
            Expanded(
              child: _transactions.isEmpty
                  ? NoTransactionAdded()
                  : TransactionsList(
                      transactions: _transactions,
                      deleteHandler: _deleteHandler,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
