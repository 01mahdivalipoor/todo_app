import 'package:todo_app/views/todo_view.dart';
import 'package:todo_app/views/done_view.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Todos'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list_alt_rounded)),
              Tab(icon: Icon(Icons.done_outline)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TodoView(),
            DoneView(),
          ],
        ),
      ),
    );
  }
}
