import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function createTransactionClick;

  NewTransaction(this.createTransactionClick);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _textTitleController = TextEditingController();
  final _textValueController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Título"),
              controller: _textTitleController,
              onSubmitted: (_) => {},
            ),
            TextField(
                decoration: const InputDecoration(labelText: "Valor"),
                controller: _textValueController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                onSubmitted: (_) => widget.createTransactionClick(
                      _textTitleController.text,
                      double.parse(_textValueController.text),
                      null,
                    )),
            Row(
              children: [
                Text("Nenhuma data selecionada!"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Selecionar Data",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            TextButton(
              onPressed: () => widget.createTransactionClick(
                  _textTitleController.text,
                  double.parse(_textValueController.text),
                  null),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text("Criar"),
            )
          ]),
    );
  }
}
