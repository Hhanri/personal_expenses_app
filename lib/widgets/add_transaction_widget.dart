import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/widgets/text_form_field_widget.dart';

class AddTransactionWidget extends StatelessWidget {
  final Function(String, double) addTransaction;
  const AddTransactionWidget({Key? key, required this.addTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormFieldWidget(controller: titleController, parameters: TitleTextFieldParameters()),
        TextFormFieldWidget(controller: amountController, parameters: AmountTextFieldParameters()),
        ElevatedButton(
          onPressed: () {
            addTransaction(titleController.text, double.parse(amountController.text));
          },
          child: const Text("Add Transaction")
        )
      ],
    );
  }
}
