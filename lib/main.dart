import 'package:finance_app/widgets/new_transaction.dart';
import 'package:finance_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(textTitleController, textValueController,
              _createTransactionClick);
        });
  }

  final List<Transaction> _transactions = [
    Transaction(
        id: 1,
        title: 'Novo tênis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 2, title: 'Conta de luz', value: 211.30, date: DateTime.now()),
  ];

  void _createTransactionClick() {
    try {
      String titleValue = textTitleController.text;
      double value = double.parse(textValueController.text);

      if (titleValue.isEmpty || value <= 0) return;

      return setState(() {
        _transactions.add(Transaction(
            id: _transactions.length + 1,
            title: titleValue,
            value: value,
            date: DateTime.now()));
      });
    } catch (_) {
      return;
    } finally {
      textTitleController.clear();
      textValueController.clear();

      Navigator.of(context).pop();
    }
  }

  final textTitleController = TextEditingController();

  final textValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas finanças'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: TransactionsList(_transactions),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
