import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_controller.dart';

class NewTransactionFormController extends GetxController {
  Map formData = {}.obs;

  @override
  void onInit() {
    _formInit();
    super.onInit();
  }

  void _formInit() {
    formData['titleController'] = TextEditingController();
    formData['valueController'] = TextEditingController();
    formData['selectedDate'] = DateTime.now();
    formData['isValidTitle'] = true;
    formData['isValidValue'] = true;
  }

  final homeController = Get.find<HomeController>();

  void submitData() {
    if (_isValidData()) {
      homeController.addNewTransaction({
        'title': formData["titleController"].text,
        'value': double.parse(formData["valueController"].text),
        'date': formData['selectedDate'],
      });
      // remove form cash
      _formInit();
    }
  }

  bool _isValidData() {
    if (formData["titleController"].text.isEmpty) {
      formData["isValidTitle"] = false;
      return false;
    } else if (formData["valueController"].text.isEmpty) {
      formData["isValidValue"] = false;
      return false;
    }

    final enteredAmount = double.parse(formData["valueController"].text);

    if (enteredAmount <= 0) {
      formData["isValidValue"] = false;
      return false;
    }
    return true;
  }

  void presentDatePicker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now().add(Duration(days: 30)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return null;
      }
      formData["selectedDate"] = pickedDate;
    });
  }
}
