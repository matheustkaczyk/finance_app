import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  String dateFormatter(String date) {
    List<String> dateList = date.toString().split(' ');
    String day = dateList[0];
    String time = dateList[1].toString().split('.')[0];
    return '$day $time';
  }

  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ]);
  }
}
