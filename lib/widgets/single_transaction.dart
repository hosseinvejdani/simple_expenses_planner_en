import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleTx extends StatelessWidget {
  final String id;
  final String title;
  final double value;
  final DateTime date;
  final Function deleteHandler;

  const SingleTx({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
    required this.deleteHandler,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO : add edit button
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            // TODO : modify cirlce avatar for long numbers
            radius: 35,
            child: FittedBox(
              child: Text(
                '\$${value.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.grey[200], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(DateFormat.yMMMEd().format(date)),
          trailing: IconButton(
            onPressed: () => deleteHandler(id),
            icon: Icon(Icons.delete),
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
