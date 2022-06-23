import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextFormFieldParameters parameters;
  const TextFormFieldWidget({Key? key, required this.controller, required this.parameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: parameters.label,
          hintText: parameters.hint
        ),
        inputFormatters: parameters.inputFormatters,
        validator: parameters.validator,
      ),
    );
  }
}
class TextFormFieldParameters {
  final String? Function(String?) validator;
  final String label;
  final String hint;
  List<TextInputFormatter> inputFormatters;
  TextFormFieldParameters({
    required this.validator,
    required this.label,
    required this.hint,
    required this.inputFormatters
  });
}

class TitleTextFieldParameters extends TextFormFieldParameters {
  TitleTextFieldParameters() : super(
    label: "Title",
    hint: "Title",
    validator: (value) {
      return null;
    },
    inputFormatters: [
      FilteringTextInputFormatter.singleLineFormatter
    ],
  );
}

class AmountTextFieldParameters extends TextFormFieldParameters {
  AmountTextFieldParameters() : super(
    label: "Amount",
    hint: "Amount",
    validator: (value) {
      if (!RegExp(r'(^\d*\.?\d{0,2})').hasMatch(value!)) {
        return "Not a correct value";
      }
      return null;
    },
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
      FilteringTextInputFormatter.singleLineFormatter
    ],
  );
}