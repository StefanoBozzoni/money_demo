import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_demo/widgets/new_transaction.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final TransactionOperation _operations;

  TransactionList(this._transactions, this._operations);

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
                Expanded(
                  child: Column(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _operations.deleteTransaction(_transactions[idx].id);
                    },
                    color: Theme.of(context).primaryColor,
                  ),
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
