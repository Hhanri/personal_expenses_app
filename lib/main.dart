import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/widgets/price_display_widget.dart';
import 'package:pesronal_expenses_app/widgets/title_display_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemCount: TransactionModel.mockData.length,
            itemBuilder: (BuildContext context, int index) {
              final TransactionModel transaction = TransactionModel.mockData[index];
              return ListTile(
                title: TitleDisplayWidget(title: transaction.title,),
                subtitle: Text(transaction.date.toString()),
                trailing: PriceDisplayWidget(
                  price: transaction.amount,
                )
              );
            },
          )
        ],
      ),
    );
  }
}
