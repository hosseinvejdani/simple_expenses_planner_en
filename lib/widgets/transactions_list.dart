import 'package:flutter/material.dart';
import './single_transaction.dart';

class TransactionsList extends StatelessWidget {
  final double txListBoxHeight;
  final List transactions;

  const TransactionsList({
    Key? key,
    required this.txListBoxHeight,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: txListBoxHeight,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, index) {
          return SingleTx(
            title: transactions[index].title,
            value: transactions[index].value,
            date: transactions[index].date,
          );
        },
      ),
    );
  }
}
