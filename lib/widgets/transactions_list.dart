import 'package:flutter/material.dart';
import './single_transaction.dart';
import 'package:get/get.dart';
import '../screens/home_controller.dart';
import './no_transaction_added.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({
    Key? key,
  }) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeController.transactions.isEmpty
        ? NoTransactionAdded()
        : ListView.builder(
            itemCount: homeController.transactions.length,
            itemBuilder: (BuildContext context, index) {
              return SingleTx(
                id: homeController.transactions[index].id,
                title: homeController.transactions[index].title,
                value: homeController.transactions[index].value,
                date: homeController.transactions[index].date,
              );
            },
          ));
  }
}
