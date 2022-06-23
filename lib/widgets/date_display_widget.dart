import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplayWidget extends StatelessWidget {
  final DateTime date;
  const DateDisplayWidget({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMd().format(date),
      style: const TextStyle(
        fontSize: 14,
        color: Colors.blueGrey
      ),
    );
  }
}
