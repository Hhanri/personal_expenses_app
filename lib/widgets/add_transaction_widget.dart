import 'package:flutter/material.dart';
import 'package:pesronal_expenses_app/widgets/text_form_field_widget.dart';

class AddTransactionWidget extends StatefulWidget {
  final Function(String, double) addTransaction;
  const AddTransactionWidget({Key? key, required this.addTransaction}) : super(key: key);

  @override
  State<AddTransactionWidget> createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  late TextEditingController titleController;
  late TextEditingController amountController;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormFieldWidget(controller: titleController, parameters: TitleTextFieldParameters()),
        TextFormFieldWidget(controller: amountController, parameters: AmountTextFieldParameters()),
        ElevatedButton(
          onPressed: () {
            widget.addTransaction(titleController.text, double.parse(amountController.text));
          },
          child: const Text("Add Transaction")
        )
      ],
    );
  }
}
