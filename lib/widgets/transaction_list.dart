import 'package:flutter/material.dart';

import 'package:finance_app/widgets/not_found.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTransaction;

  TransactionsList(this.transactions, this.deleteTransaction);

  String dateFormatter(String date) {
    List<String> dateList = date.toString().split(' ');
    String day = dateList[0];
    return '$day';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: transactions.isEmpty == true
          ? NotFound('Nenhum registro encontrado ainda!')
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => deleteTransaction(transaction.id),
                  child: Card(
                    color: Colors.lightBlue,
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          child: FittedBox(
                            child: Text(
                              "R\$ ${transaction.value.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.amberAccent,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          transaction.title.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          dateFormatter(transaction.date.toString()),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => deleteTransaction(transaction.id),
                        )),
                  ),
                );
              },
            ),
    );
  }
}
