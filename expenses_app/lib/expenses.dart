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
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.other),
  ];

  void openAddExpenseModal() {
    setState(() {
      expensesList = [];
    });
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
        const Text("Expenses"),
        ExpensesList(expensesList),
      ]),
    );
  }
}
