import 'package:finance_app/widgets/transaction_list.dart';
import 'package:finance_app/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Minhas finanças'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              )
            ],
          ),
          body: SingleChildScrollView(
            child: UserTransactions(),
          )),
    );
  }
}
