import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/widgets/date_picker_widget.dart';
import 'package:pesronal_expenses_app/widgets/text_form_field_widget.dart';

class AddTransactionWidget extends StatefulWidget {
  final Function(String, double, DateTime) addTransaction;
  const AddTransactionWidget({Key? key, required this.addTransaction}) : super(key: key);

  @override
  State<AddTransactionWidget> createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  DateTime? date;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    amountController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormFieldWidget(controller: titleController, parameters: TitleTextFieldParameters()),
            TextFormFieldWidget(controller: amountController, parameters: AmountTextFieldParameters()),
            DatePickerWidget(
              date: date,
              onChange: (newDate) {
                setState(() {
                  date = newDate;
                });
              }
            ),
            ElevatedButton(
              onPressed: () {
                widget.addTransaction(titleController.text, double.parse(amountController.text), date ?? DateTime.now());
              },
              child: const Text("Add Transaction")
            )
          ],
        ),
      ),
    );
  }
}
