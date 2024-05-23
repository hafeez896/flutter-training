import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, Key? key}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(expense.amount.toString()),
              const Spacer(),
              Icon(categoryIcons[expense.category]),
              const SizedBox(
                width: 8,
              ),
              Text(expense.formattedDate),
            ],
          )
        ]),
      ),
    );
  }
}
