import 'package:flutter/material.dart';

class NewTransactionForm extends StatefulWidget {
  final double height;
  final Function newTransactionHandler;
  const NewTransactionForm(
      {required this.newTransactionHandler, required this.height, Key? key})
      : super(key: key);

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Center(
              child: Text(
                'Add New Transaction',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'title',
            ),
            controller: titleController,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'value',
            ),
            controller: valueController,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'CANCLE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () => widget.newTransactionHandler({
                  'title': titleController.text,
                  'value': double.parse(valueController.text),
                }),
                child: Text(
                  'ADD',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
