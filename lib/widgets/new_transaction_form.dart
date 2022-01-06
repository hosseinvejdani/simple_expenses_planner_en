import 'package:flutter/material.dart';

class NewTransactionForm extends StatefulWidget {
  final double height;
  final Function newTransactionHandler;
  final VoidCallback cancleButtonHandler;
  const NewTransactionForm({
    required this.cancleButtonHandler,
    required this.newTransactionHandler,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  bool _isValidTitle = true;
  bool _isValidValue = true;

  void _submitData() {
    if (_isValidData()) {
      widget.newTransactionHandler({
        'title': _titleController.text,
        'value': double.parse(_valueController.text),
      });
    }
  }

  bool _isValidData() {
    if (_titleController.text.isEmpty) {
      setState(() {
        _isValidTitle = false;
      });
      return false;
    } else if (_valueController.text.isEmpty) {
      setState(() {
        _isValidValue = false;
      });
      return false;
    }

    final enteredAmount = double.parse(_valueController.text);

    if (enteredAmount <= 0) {
      setState(() {
        _isValidValue = false;
      });
      return false;
    }

    return true;
  }

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
                errorText: _isValidTitle ? null : 'Title can not be empty!!'),
            controller: _titleController,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'value',
              errorText: _isValidValue
                  ? null
                  : 'Value can not be empty, zero of negative number!!',
            ),
            controller: _valueController,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: widget.cancleButtonHandler,
                  child: Text(
                    'CANCLE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: _submitData,
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
