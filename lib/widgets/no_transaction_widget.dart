import 'package:flutter/material.dart';

class NoTransactionWidget extends StatelessWidget {
  const NoTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No Transaction added yet!", style: Theme.of(context).textTheme.headline4,),
          const SizedBox(height: 15,),
          SizedBox(height: 200, child: Image.asset('assets/images/waiting.png')),
        ],
      ),
    );
  }
}
