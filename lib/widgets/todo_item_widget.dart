import 'package:todo_app/models/done_model/done_model.dart';
import 'package:todo_app/models/boxes.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final int i;

  const TodoItem({required this.title, required this.i});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: Icon(
          Icons.close,
          size: 20,
        ),
        onPressed: () {
          final todos = Boxes.getTodos().get(i);
          final Done newDone = Done()..done = todos!.todo;
          Boxes.getDones().add(newDone);
          Boxes.getTodos().delete(i);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Done'),
              duration: Duration(milliseconds: 600),
            ),
          );
        },
      ),
    );
  }
}
