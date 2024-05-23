import "package:firstapp/custom_container.dart";
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 72, 17, 81),
          title: const Text('Sample Code'),
        ),
        body: CustomContainer(),
      ),
    ),
  );
}
