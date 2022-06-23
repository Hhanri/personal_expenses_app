import 'package:flutter/material.dart';

class PriceDisplayWidget extends StatelessWidget {
  final double price;
  const PriceDisplayWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),
      child: Text(
        "$price \$",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
      )
    );
  }
}
