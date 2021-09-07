import 'package:todo_app/models/done_model/done_model.dart';
import 'package:todo_app/models/todo_model/todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Todo> getTodos() => Hive.box<Todo>('todo');

  static Box<Done> getDones() => Hive.box<Done>('done');

  static hiveInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    Hive.registerAdapter(DoneAdapter());
    await Hive.openBox<Todo>('todo');
    await Hive.openBox<Done>('done');
  }

  static reversed(value) {
    return value.toList().reversed.toList();
  }
}
