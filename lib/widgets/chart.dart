import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> myTransactionsList;

  Chart(this.myTransactionsList) {
    print(groupedTransctionsByDay.toString());
  }

  List<Map<String, Object>> get groupedTransctionsByDay {
    var data = groupBy(myTransactionsList, (Transaction element) {
      return DateFormat.E().format(element.date);
    });

    List<Map<String, Object>> recentDays = [];
    List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      recentDays.add({"day": DateFormat.E().format(weekDay), "amount": 0});
    });

    List<Map<String, Object>> lista = [];
    //var keys = data.keys.toList();
    for (var element in recentDays) {
      var som = 0.0;
      for (Transaction trans in data[element['day']] ?? []) {
        som = som + trans.amount;
      }
      lista.add({"day": element['day'], "amount": som});
    }
    return lista.reversed.toList();
  }

  double get calcTotal {
    return myTransactionsList.fold(0.0, (sum, item) {
      return sum = sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransctionsByDay.map((el) {
              return ChartBar(el['day'], el['amount'],
                  calcTotal == 0 ? 0 : (el['amount'] as double) / calcTotal);
            }).toList()));
  }
}
