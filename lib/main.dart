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

  String dateFormatter(String date) {
    List<String> dateList = date.toString().split(' ');
    String day = dateList[0];
    String time = dateList[1].toString().split('.')[0];
    return '$day $time';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minhas finanças'),
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(2),
            child: Card(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    TextField(decoration: InputDecoration(labelText: "Título")),
                    TextField(
                      decoration: InputDecoration(labelText: "Valor"),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text("Criar"),
                    )
                  ]),
            ),
          ),
          ...(transactions
              .map((transaction) => SizedBox(
                    height: 80,
                    child: Card(
                      color: Colors.lightBlue,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.yellow, width: 2))),
                            child: Text(
                              "R\$ ${transaction.value.toString()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                transaction.title,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                dateFormatter(transaction.date.toString()),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
              .toList())
        ]),
      ),
    );
  }
}
