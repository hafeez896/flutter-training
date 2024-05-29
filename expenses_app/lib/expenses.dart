import 'package:expenses_app/expenses_List.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var expensesList = [
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Dinner',
        amount: 200.00,
        date: DateTime.now(),
        category: Category.food),
  ];

  void openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      expensesList.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = expensesList.indexOf(expense);

    setState(() {
      expensesList.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              expensesList.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
        ),
        actions: [
          IconButton(
              onPressed: openAddExpenseModal, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ExpensesList(
          expensesList,
          removeExpense: removeExpense,
        ),
      ]),
    );
  }
}
