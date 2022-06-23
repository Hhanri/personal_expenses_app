import 'package:flutter/material.dart';

class TitleDisplayWidget extends StatelessWidget {
  final String title;
  const TitleDisplayWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
