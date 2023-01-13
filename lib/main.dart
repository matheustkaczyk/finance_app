import 'package:finance_app/widgets/transaction_list.dart';
import 'package:finance_app/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void createBtnClick() {
    // transactions.add(Transaction(
    //     id: transactions.length + 1,
    //     title: textTitleController.text,
    //     value: double.parse(textValueController.text),
    //     date: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minhas finanças'),
        ),
        body: UserTransactions(),
      ),
    );
  }
}
