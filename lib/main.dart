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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionModel> transactions = [...TransactionModel.mockData];

  void _addTransaction(String title, double amount) {
    setState(() {
      transactions.add(TransactionModel(id: UniqueKey().toString(), title: title, amount: amount, date: DateTime.now()));
    });
    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddTransactionWidget(addTransaction: _addTransaction)
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => _startAddNewTransaction(context), icon: const  Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: TransactionsListWidget(transactions: transactions,)),
        ],
      )
    );
  }
}
