class TransactionModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date
  });

  static List<TransactionModel> mockData = [
    TransactionModel(id: 't1', title: 'New Shoes', amount: 129.99, date: DateTime.now()),
    TransactionModel(id: 't2', title: 'Groceries', amount: 10.90, date: DateTime.now()),
  ];
}