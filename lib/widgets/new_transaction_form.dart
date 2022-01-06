import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  final Function newTransactionHandler;
  final VoidCallback cancleButtonHandler;
  const NewTransactionForm({
    required this.cancleButtonHandler,
    required this.newTransactionHandler,
    Key? key,
  }) : super(key: key);

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  bool _isValidTitle = true;
  bool _isValidValue = true;

  void _submitData() {
    if (_isValidData()) {
      widget.newTransactionHandler({
        'title': _titleController.text,
        'value': double.parse(_valueController.text),
        'date': _selectedDate,
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

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now().add(Duration(days: 30)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return null;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date:     ${DateFormat.yMMMd().format(_selectedDate)}',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: _presentDatePicker,
                child: Text(
                  'Choose Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
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
