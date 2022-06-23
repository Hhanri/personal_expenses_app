import 'package:flutter/material.dart';

class DateDisplayWidget extends StatelessWidget {
  final DateTime date;
  const DateDisplayWidget({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      date.toString(),
      style: const TextStyle(
        fontSize: 14,
        color: Colors.blueGrey
      ),
    );
  }
}
