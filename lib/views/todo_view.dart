import 'package:todo_app/models/todo_model/todo_model.dart';
import 'package:todo_app/widgets/todo_item_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/boxes.dart';
import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        TextField(
          controller: todoController,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: 'Add Todo',
          ),
          onSubmitted: (input) {
            if (input.isNotEmpty) {
              final newTodo = Todo()..todo = input;
              final box = Boxes.getTodos();
              box.add(newTodo);
              todoController.text = '';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Todo Added successfully'),
                  duration: Duration(milliseconds: 600),
                ),
              );
            }
          },
        ),
        SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: Boxes.getTodos().listenable(),
          builder: (context, box, _) {
            final Box<Todo> box = Boxes.getTodos();
            final List<Todo> todos = Boxes.reversed(box.values).cast<Todo>();
            final List<dynamic> keys = Boxes.reversed(box.keys);
            return Container(
              height: MediaQuery.of(context).size.height * .6,
              child: todos.isEmpty
                  ? Center(
                      child: Text('You are done! Take a break and come back.'),
                    )
                  : Column(
                      children: List.generate(
                        todos.length,
                        (i) => TodoItem(
                          title: todos[i].todo,
                          i: keys[i],
                        ),
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
