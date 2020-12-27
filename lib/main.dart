import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactionList = [
    Transaction(id: "1", title: "prova1", amount: 10.0, date: DateTime.now()),
    Transaction(id: "2", title: "prova2", amount: 20.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: Card(
                child: Center(
                  child: Text(
                    "MONEY CHART",
                  ),
                ),
                elevation: 5,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transactionList.map((tx) {
                return Row(children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.purple)),
                      child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            tx.amount.toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
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
                      Text(tx.date.toString(),
                          style: TextStyle(fontSize: 15.0, color: Colors.grey))
                    ],
                  )
                ]);
              }).toList(),
            )
          ],
        ));
  }
}
