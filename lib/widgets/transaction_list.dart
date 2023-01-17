import 'package:finance_app/widgets/not_found.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionsList extends StatefulWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  String dateFormatter(String date) {
    List<String> dateList = date.toString().split(' ');
    String day = dateList[0];
    String time = dateList[1].toString().split('.')[0];
    return '$day $time';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: widget.transactions.isEmpty == true
          ? NotFound('Nenhum registro encontrado ainda!')
          : ListView.builder(
              itemCount: widget.transactions.length,
              itemBuilder: (context, index) {
                final transaction = widget.transactions[index];
                return Card(
                  color: Colors.lightBlue,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "R\$ ${transaction.value.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.amberAccent),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
