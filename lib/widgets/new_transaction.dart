import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class TransactionOperation {
  void addNewTransaction(String title, double amount, DateTime aDate);
  void deleteTransaction(String id);
}

class NewTransaction extends StatefulWidget {
  //final DateTime _selectedDate;
  //final UserTransactionState ut;
  final TransactionOperation transactionOperation;

  NewTransaction(this.transactionOperation);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();

  void postTransaction() {
    String enteredText = titleController.text;
    double enteredAmount = double.parse(amountController.text);
    DateTime date = DateFormat("dd/MM/yyyy").parse(dateController.text);

    if ((enteredText.isEmpty) || (enteredAmount < 0)) return;

    widget.transactionOperation
        .addNewTransaction(enteredText, enteredAmount, date);

    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    // DateTime data;
    showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((aDate) =>
        dateController.text = DateFormat('dd/MM/yyyy').format(aDate));
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
        Row(children: [
          Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(labelText: "data"),
              controller: dateController,
              onSubmitted: (_) => postTransaction(),
              keyboardType: TextInputType.datetime,
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: _openDatePicker,
          ),
        ]),
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
