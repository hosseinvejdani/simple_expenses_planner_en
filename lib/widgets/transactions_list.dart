import 'package:flutter/material.dart';
import './single_transaction.dart';

class TransactionsList extends StatelessWidget {
  final List transactions;
  final Function deleteHandler;

  const TransactionsList({
    Key? key,
    required this.transactions,
    required this.deleteHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO : sort list base on date
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, index) {
        return SingleTx(
          id: transactions[index].id,
          title: transactions[index].title,
          value: transactions[index].value,
          date: transactions[index].date,
          deleteHandler: deleteHandler,
        );
      },
    );
  }
}
