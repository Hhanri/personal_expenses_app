import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/models/transaction_model.dart';
import 'package:pesronal_expenses_app/views/landscape_view.dart';
import 'package:pesronal_expenses_app/views/portrait_view.dart';
import 'package:pesronal_expenses_app/widgets/add_transaction_widget.dart';
import 'package:pesronal_expenses_app/views/no_transaction_view.dart';

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
        textTheme: const TextTheme(
          headline4: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
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

  List<TransactionModel> get recentTransactions {
    return transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      transactions.add(
        TransactionModel(
          id: UniqueKey().toString(),
          title: title,
          amount: amount,
          date: date
        )
      );
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

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    final dynamic appBar = Platform.isIOS
      ? CupertinoNavigationBar(
          middle: const Text('Personal Expenses'),
          trailing: CupertinoButton(onPressed: () => _startAddNewTransaction(context), child: const Icon(Icons.add),)
      ,
        )
      : AppBar(
          title: const Text('Personal Expenses'),
          actions: [
            IconButton(onPressed: () => _startAddNewTransaction(context), icon: const  Icon(Icons.add))
          ],
        );

    return Platform.isIOS
      ? CupertinoPageScaffold(
          navigationBar: appBar,
          child: pageBody(),
        )
      : Scaffold(
          appBar: appBar,
          body: pageBody()
        );
  }

  Widget pageBody() {
    return transactions.isEmpty
      ? const NoTransactionWidget()
      : MediaQuery.of(context).orientation == Orientation.portrait
        ? PortraitView(transactions: transactions, recentTransactions: recentTransactions, deleteTransaction: deleteTransaction)
        : LandscapeView(transactions: transactions, recentTransactions: recentTransactions, deleteTransaction: deleteTransaction);
  }
}
