import 'package:todo_app/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';

void main() async {
  await Boxes.hiveInit();
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const _primaryColor = Colors.cyanAccent;
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: _primaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(10),
    );
    return MaterialApp(
      title: 'Flutter Todo App',
      home: MainApp(),
      theme: ThemeData(
        brightness: Brightness.dark,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: _primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
