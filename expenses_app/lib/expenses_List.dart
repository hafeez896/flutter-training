import 'package:expenses_app/expense_item.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, {Key? key}) : super(key: key);

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (ctx, index) => ExpenseItem(
          expense: expensesList[index],
        ),
      ),
    );
  }
}
