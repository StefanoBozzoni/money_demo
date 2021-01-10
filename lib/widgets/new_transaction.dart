import 'package:flutter/material.dart';

abstract class TransactionOperation {
  void addNewTransaction(String title, double amount);
}

class NewTransaction extends StatefulWidget {
  //final UserTransactionState ut;
  final TransactionOperation transactionOperation;

  NewTransaction(this.transactionOperation);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void postTransaction() {
    String enteredText = titleController.text;
    double enteredAmount = double.parse(amountController.text);

    if ((enteredText.isEmpty) || (enteredAmount < 0)) return;

    widget.transactionOperation.addNewTransaction(enteredText, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: InputDecoration(labelText: "title"),
          controller: titleController,
          autofocus: true,
        ),
        TextField(
          decoration: InputDecoration(labelText: "amount"),
          controller: amountController,
          onSubmitted: (_) => postTransaction(),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        FlatButton(
          child: Text("submit"),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {
            postTransaction();
            /*
            ut.addNewTransaction(
                titleController.text, double.parse(amountController.text));
            */
          },
        )
      ]),
    );
  }
}
