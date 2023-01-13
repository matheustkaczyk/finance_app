import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final textTitleController = TextEditingController();

  final textValueController = TextEditingController();

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(2),
        child: Card(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: "Título"),
                  controller: textTitleController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: "Valor"),
                  controller: textValueController,
                ),
                TextButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text("Criar"),
                )
              ]),
        ),
      ),
    );
  }
}
