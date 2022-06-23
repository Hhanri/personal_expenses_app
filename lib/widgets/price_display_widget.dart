import 'package:flutter/material.dart';

class PriceDisplayWidget extends StatelessWidget {
  final double price;
  const PriceDisplayWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),
      child: Text("${price} \$",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
      )
    );
  }
}
