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
    formData['titleErrorMessage'] = null;
    formData['valueErrorMessage'] = null;
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

  bool _isValidTitle() {
    if (formData["titleController"].text.isEmpty) {
      formData["isValidTitle"] = false;
      formData['titleErrorMessage'] = 'The Title Can Not be Empty!';
      return false;
    } else {
      formData["isValidTitle"] = true;
      formData['titleErrorMessage'] = null;
      return true;
    }
  }

  bool _isValidValue() {
    if (formData["valueController"].text.isEmpty) {
      formData["isValidValue"] = false;
      formData['valueErrorMessage'] = 'The Value Can Not be Empty!';
      return false;
    }

    final enteredAmount = double.parse(formData["valueController"].text);

    if (enteredAmount <= 0) {
      formData["isValidValue"] = false;
      formData['valueErrorMessage'] = 'The Value Can Not be Zero or Negative!';
      return false;
    }

    formData["isValidValue"] = true;
    formData['valueErrorMessage'] = null;
    return true;
  }

  bool _isValidData() {
    return _isValidTitle() && _isValidValue();
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
