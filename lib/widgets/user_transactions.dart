import 'package:finance_app/widgets/new_transaction.dart';
import 'package:finance_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transaction> _transactions = [
    Transaction(
        id: 1,
        title: 'Novo tênis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 2, title: 'Conta de luz', value: 211.30, date: DateTime.now()),
  ];

  final textTitleController = TextEditingController();

  final textValueController = TextEditingController();

  void _createTransactionClick() {
    return setState(() {
      _transactions.add(Transaction(
          id: _transactions.length + 1,
          title: textTitleController.text,
          value: double.parse(textValueController.text),
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
            textTitleController, textValueController, _createTransactionClick),
        TransactionsList(_transactions)
      ],
    );
  }
}