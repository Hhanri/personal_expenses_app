import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/widgets/price_display_widget.dart';
import 'package:pesronal_expenses_app/widgets/title_display_widget.dart';

import 'date_display_widget.dart';

class TransactionListTileWidget extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionListTileWidget({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TitleDisplayWidget(title: transaction.title,),
      subtitle: DateDisplayWidget(date: transaction.date,),
      trailing: PriceDisplayWidget(
        price: transaction.amount,
      )
    );
  }
}
