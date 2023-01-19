import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final textTitleController;

  final textValueController;

  VoidCallback createBtnClick;

  NewTransaction(
      this.textTitleController, this.textValueController, this.createBtnClick);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
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
              controller: widget.textTitleController,
              onSubmitted: (_) => {},
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Valor"),
              controller: widget.textValueController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              onSubmitted: (_) => widget.createBtnClick(),
            ),
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
              onPressed: widget.createBtnClick,
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
