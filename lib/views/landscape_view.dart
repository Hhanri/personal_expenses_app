import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/widgets/chart_widget.dart';
import 'package:pesronal_expenses_app/widgets/transactions_list_widget.dart';

class LandscapeView extends StatelessWidget {
  final List<TransactionModel> transactions;
  final List<TransactionModel> recentTransactions;
  final void Function(String) deleteTransaction;
  const LandscapeView({Key? key, required this.transactions, required this.recentTransactions, required this.deleteTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: ChartWidget(transactions: recentTransactions,)
        ),
        Expanded(
          flex: 5,
          child: TransactionsListWidget(
            transactions: transactions,
            onDelete: deleteTransaction,
          )
        ),
      ],
    );
  }
}
