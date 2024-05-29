import 'package:flutter/material.dart';
import 'package:expenses_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpense, {Key? key}) : super(key: key);

  final void Function(Expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? selectedDate;
  Category selectedCategory = Category.other;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      selectedDate = date;
    });
  }

  void saveExpense() {
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null || (enteredAmount <= 0);

    if (titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null) {
      // error
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Invalid input"),
                content: Text("Please check the input"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text("okay"))
                ],
              ));
      return;
    }
    widget.addExpense(Expense(
        title: titleController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 16, left: 16, right: 16, bottom: keyBoardSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Title")),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(label: Text("Amount")),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Text(selectedDate == null
                    ? "No date selected"
                    : formatter.format(selectedDate!)),
                IconButton(
                    onPressed: openDatePicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name),
                        ))
                    .toList(),
                onChanged: (category) {
                  if (category == null) {
                    return;
                  }
                  setState(() {
                    selectedCategory = category;
                  });
                }),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"),
                ),
                ElevatedButton(
                    onPressed: saveExpense, child: const Text("Save")),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
