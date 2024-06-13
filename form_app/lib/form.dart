import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

enum Categories { food, movie, others }

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();

  Categories selectedCategory = Categories.food;

  bool isLoading = true;

  var title = "";
  var amount = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() async {
    final url = Uri.https(
        "flutter-training-8d805-default-rtdb.firebaseio.com", "my-form.json");

    final response = await http.get(url);

    setState(() {
      isLoading = false;
    });

    // print(response.body);
  }

  void deleteData() async {
    final url = Uri.https("flutter-training-8d805-default-rtdb.firebaseio.com",
        "my-form/-O-G0vqud92Ro31FHRPu.json");

    final response = await http.delete(url);

    print(response.statusCode);
  }

  void onSaveClick() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    final url = Uri.https(
        "flutter-training-8d805-default-rtdb.firebaseio", "my-form.json");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {'title': title, 'amount': amount, 'category': selectedCategory.name},
        ),
      );

      if (response.statusCode != 200) {
        print("Some error");
      }

      print(response.statusCode);
      print(response.body);
    } catch (error) {
      print(error);
    }

    // print(title);
    // print(amount);
    // print(selectedCategory);
  }

  void showSnackbarMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(children: [
          TextFormField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "title cannot be empty";
              }
              if (value.length < 3) {
                return "title should be atleast 3 characters";
              }
              return null;
            },
            onSaved: (value) {
              title = value!;
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: "1",
                  decoration: const InputDecoration(label: Text("Amount")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "amount cannot be empty";
                    }
                    if (int.tryParse(value) != null && int.parse(value) > 0) {
                      return null;
                    }
                    return "enter valid amount";
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    amount = value!;
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: DropdownButtonFormField(
                  value: selectedCategory,
                  items: [
                    for (final category in Categories.values)
                      DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(category.name)
                            ],
                          ))
                  ],
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedCategory = value!;
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: deleteData, child: const Text("Delete")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onSaveClick, child: const Text("Save"))
            ],
          ),
        ]),
      ),
    );
  }
}
