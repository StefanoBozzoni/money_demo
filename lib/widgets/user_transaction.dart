import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  UserTransactionState createState() => UserTransactionState();
}

class UserTransactionState extends State<UserTransaction>
    implements TransactionOperation {
  final List<Transaction> _transactions = [
    Transaction(id: "1", title: "prova1", amount: 10.0, date: DateTime.now()),
    Transaction(id: "2", title: "prova2", amount: 20.0, date: DateTime.now())
  ];

  void addNewTransaction(String txtitle, double txamount) {
    Transaction ntx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());

    setState(() {
      _transactions.add(ntx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(this), TransactionList(_transactions)],
    );
  }
}
