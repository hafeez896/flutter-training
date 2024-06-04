import 'package:expenses_app/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(colorScheme: darkColorScheme),
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSecondaryContainer,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ));
  });
}
