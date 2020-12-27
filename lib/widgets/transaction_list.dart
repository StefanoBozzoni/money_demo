import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _transactions = [
    Transaction(id: "1", title: "prova1", amount: 10.0, date: DateTime.now()),
    Transaction(id: "2", title: "prova2", amount: 20.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _transactions.map((tx) {
        return Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple)),
                  child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '${tx.amount.toString()} €',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(DateFormat("dd/MM/yyyy").format(tx.date),
                      style: TextStyle(fontSize: 15.0, color: Colors.grey))
                ],
              )
            ]),
          ),
        );
      }).toList(),
    );
  }
}
