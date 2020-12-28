import 'package:flutter/material.dart';
//import '../widgets/user_transaction.dart';

abstract class TransactionOperation {
  addNewTransaction(String title, double amount);
}

class NewTransaction extends StatelessWidget {
  //final UserTransactionState ut;
  final TransactionOperation transactionOperation;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.transactionOperation);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: InputDecoration(labelText: "title"),
          controller: titleController,
        ),
        TextField(
          decoration: InputDecoration(labelText: "amount"),
          controller: amountController,
        ),
        FlatButton(
          child: Text("submit"),
          textColor: Colors.blue,
          onPressed: () {
            /*
            ut.addNewTransaction(
                titleController.text, double.parse(amountController.text));
            */
            transactionOperation.addNewTransaction(
                titleController.text, double.parse(amountController.text));
          },
        )
      ]),
    );
  }
}
