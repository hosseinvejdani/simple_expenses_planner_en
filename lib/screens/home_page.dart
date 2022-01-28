import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_controller.dart';
import '../widgets/transactions_list.dart';
import '../widgets/last_week_chart_box.dart';
import '../widgets/new_transaction_form.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransactionForm(
          newTransactionHandler: homeController.addNewTransaction,
          cancleButtonHandler: homeController.cancleAddingNewTransaction,
        );
      },
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            LastWeekChartBox(
              height: _boxChartHeight,
            ),
            Expanded(
              child: TransactionsList(),
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
