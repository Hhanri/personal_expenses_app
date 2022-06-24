import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/widgets/transaction_list_tile_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final void Function(String) onDelete;
  const TransactionsListWidget({Key? key, required this.transactions, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final TransactionModel transaction = transactions[index];
        return Dismissible(
          key: Key(transaction.id),
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onDelete(transaction.id);
          },
          child: TransactionListTileWidget(transaction: transaction)
        );
      },
    );
  }
}
