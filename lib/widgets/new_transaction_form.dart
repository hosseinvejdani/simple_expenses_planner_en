import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';
import '../controllers/form_controller.dart';

class NewTransactionForm extends StatelessWidget {
  NewTransactionForm({Key? key}) : super(key: key);

  final formController = Get.put(NewTransactionFormController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      width: double.infinity,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Obx(() {
              return TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'title',
                    errorText: formController.formData['titleErrorMessage']),
                controller: formController.formData['titleController'],
              );
            }),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              return TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'value',
                  errorText: formController.formData['valueErrorMessage'],
                ),
                controller: formController.formData['valueController'],
              );
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                      'Date:     ${DateFormat.yMMMd().format(formController.formData['selectedDate'])}',
                      style: TextStyle(fontSize: 16),
                    )),
                TextButton(
                  onPressed: () => formController.presentDatePicker(context),
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
                    onPressed: homeController.cancleAddingNewTransaction,
                    child: Text(
                      'CANCLE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: formController.submitData,
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
