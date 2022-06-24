import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime? date;
  final void Function(DateTime?) onChange;
  const DatePickerWidget({Key? key, this.date, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(date == null ? "No date chosen!" : DateFormat.yMMMd().format(date!)),
        TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: date == null ? DateTime.now() : date!,
              firstDate: DateTime(2018),
              lastDate: DateTime.now()
            ).then((value) {
              onChange(value);
            });
          },
          child: const Text("Select Date")
        )
      ],
    );
  }
}
