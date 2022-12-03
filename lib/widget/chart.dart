import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widget/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get _groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (int i = 0; i < recentTransaction.length; i+=1) {
        if (recentTransaction[i].date.day == weekDay.day ||
            recentTransaction[i].date.month == weekDay.month ||
            recentTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTransaction[i].price;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'price': totalSum
      };
    });
  }
  double get totalSpending {
    return _groupedTransactionValues.fold(0.0, (sum, item) {
      return sum +(item['price'] as double);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Row(
          children: _groupedTransactionValues.map((data) {
        return ChartBar(
            data['day'].toString(),
            data['price'] as double,
            (data['price'] as double) / totalSpending);
      }).toList()),
    );
  }
}
