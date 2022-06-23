import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/widgets/add_transaction_widget.dart';
import 'package:pesronal_expenses_app/widgets/transactions_list_widget.dart';

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
    return const Scaffold(
      body: HomeView()
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TransactionModel> transactions = [...TransactionModel.mockData];

  void addTransaction(String title, double amount) {
    setState(() {
      transactions.add(TransactionModel(id: UniqueKey().toString(), title: title, amount: amount, date: DateTime.now()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransactionWidget(addTransaction: addTransaction,),
        Expanded(
          child: TransactionsListWidget(transactions: transactions,)
        )
      ],
    );
  }
}
