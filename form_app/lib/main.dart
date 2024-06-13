import 'package:flutter/material.dart';
import 'package:form_app/form.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
        ),
        body: const MyForm(),
      ),
    ),
  );
}
