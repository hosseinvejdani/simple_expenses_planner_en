import 'package:flutter/material.dart';
import './transactions_list.dart';
import './last_week_chart_box.dart';
import './new_transaction_form.dart';
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
            height: 600, newTransactionHandler: _addNewTransaction);
      },
    );
  }

  void _addNewTransaction(Map data) {
    DateTime _date = DateTime.now();
    Transaction newTx = Transaction(
      id: _date.toString(),
      title: data['title'],
      value: data['value'],
      date: _date,
    );
    setState(() {
      _transactions.add(newTx);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // double _width = MediaQuery.of(context).size.width;
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
            Container(
              height: _boxChartHeight,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 7, bottom: 10),
              child: Card(
                child: LastWeekChartBox(),
                elevation: 5,
              ),
            ),
            Expanded(
              child: TransactionsList(transactions: _transactions),
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
