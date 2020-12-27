import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            TransactionList(),
          ],
        ));
  }
}
