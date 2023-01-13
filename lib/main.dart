import 'package:finance_app/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> transactions = [
    Transaction(
        id: 1,
        title: 'Novo tênis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 2, title: 'Conta de luz', value: 211.30, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minhas finanças'),
        ),
        body: Column(children: [
          ...(transactions
              .map((transaction) => Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.yellowAccent,
                          padding: const EdgeInsets.all(10),
                          child: Text("\$ ${transaction.value.toString()}"),
                        ),
                        Column(
                          children: [
                            Text(transaction.title),
                            Text(transaction.date.toString()),
                          ],
                        )
                      ],
                    ),
                  ))
              .toList())
        ]),
      ),
    );
  }
}
