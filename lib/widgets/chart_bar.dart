import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double dayAmount;
  final double percAmount;

  ChartBar(this.day, this.dayAmount, this.percAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${dayAmount.toStringAsFixed(2)}€"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: percAmount,
                  child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10))),
                ))
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text("$day")
      ],
    );
  }
}
