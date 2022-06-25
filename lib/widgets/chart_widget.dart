import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';

class ChartWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  const ChartWidget({Key? key, required this.transactions}) : super(key: key);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
          transactions[i].date.year == weekDay.year &&
          transactions[i].date.month == weekDay.month) {
            totalSum += transactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get maxWeekSpending {
    return groupedTransactionValues.fold(0.0, (sum, element) {
      return sum + element['amount'];
    });
  }
  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: groupedTransactionValues.reversed.map((day) {
            return Expanded(
              child: ChartBarWidget(
                label: day['day'],
                spendingAmount: day['amount'],
                spendingPercentage: day['amount'] == 0.0 ? 0.0 : day['amount']/maxWeekSpending
              )
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ChartBarWidget extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;
  const ChartBarWidget({
    Key? key,
    required this.label,
    required this.spendingAmount,
    required this.spendingPercentage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text("\$${spendingAmount.toStringAsFixed(2)}")
          ),
        ),
        const SizedBox(height: 4,),
        FittedBox(
          child: SizedBox(
            height: 80,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    color: const Color.fromARGB(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 4,),
        Text(label)
      ],
    );
  }
}
