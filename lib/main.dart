import 'package:flutter/material.dart';
import 'package:money_demo/widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.yellow,
          disabledColor: Colors.grey),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    implements TransactionOperation {
  final List<Transaction> _transactions = [
    Transaction(id: "1", title: "prova1", amount: 10.0, date: DateTime.now()),
    Transaction(
        id: "2",
        title: "prova2",
        amount: 20.0,
        date: DateTime.now().subtract(Duration(days: 1)))
  ];

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(this);
        });
  }

  @override
  void addNewTransaction(String txtitle, double txamount, DateTime aDate) {
    //void addNewTransaction(String txtitle, double txamount) {
    Transaction ntx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: aDate);

    setState(() {
      _transactions.add(ntx);
    });
  }

  @override
  void deleteTransaction(String pId) {
    setState(() {
      _transactions.removeWhere((el) {
        return el.id == pId;
      });
    });
  }

  List<Transaction> getRecentTransactions(List<Transaction> transactionList) {
    var prevDate = DateTime.now().subtract(Duration(days: 7));
    return transactionList
        .where((element) => element.date.isAfter(prevDate))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddnewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Center(
                  child: Chart(getRecentTransactions(_transactions)),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions, this),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddnewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
