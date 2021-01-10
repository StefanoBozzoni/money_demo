import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor)),
                    child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '${_transactions[idx].amount.toStringAsFixed(2)} €',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _transactions[idx].title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        DateFormat("dd/MM/yyyy")
                            .format(_transactions[idx].date),
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.grey.shade600))
                  ],
                )
              ]),
            ),
          );
        },
        itemCount: _transactions.length,
      ),
    );
  } //build
} //class
