import 'package:flutter/material.dart';

import 'package:finance_app/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Transaction> transactions = [
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

  String dateFormatter(String date) {
    List<String> dateList = date.toString().split(' ');
    String day = dateList[0];
    String time = dateList[1].toString().split('.')[0];
    return '$day $time';
  }

  void createBtnClick() {
    transactions.add(Transaction(
        id: transactions.length + 1,
        title: textTitleController.text,
        value: double.parse(textValueController.text),
        date: DateTime.now()));
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
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Título"),
                      controller: textTitleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Valor"),
                      controller: textValueController,
                    ),
                    TextButton(
                      onPressed: createBtnClick,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text("Criar"),
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
