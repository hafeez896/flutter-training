import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  const NewExpense({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [Text("Modal bottomsheet")]),
    );
  }
}
