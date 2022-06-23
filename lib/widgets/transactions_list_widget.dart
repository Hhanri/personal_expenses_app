import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/widgets/transaction_list_tile_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  const TransactionsListWidget({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final TransactionModel transaction = transactions[index];
        return TransactionListTileWidget(transaction: transaction);
      },
    );
  }
}
