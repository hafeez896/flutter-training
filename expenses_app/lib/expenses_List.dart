import 'package:expenses_app/expense_item.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, {required this.removeExpense, Key? key})
      : super(key: key);

  final void Function(Expense) removeExpense;

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.5)),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            removeExpense(expensesList[index]);
          },
          key: ValueKey(expensesList[index]),
          child: ExpenseItem(
            expense: expensesList[index],
          ),
        ),
      ),
    );
  }
}
