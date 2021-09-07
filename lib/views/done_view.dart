import 'package:todo_app/models/done_model/done_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/boxes.dart';
import 'package:flutter/material.dart';

class DoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: Boxes.getDones().listenable(),
          builder: (context, box, _) {
            final Box<Done> box = Boxes.getDones();
            final List<Done> dones = Boxes.reversed(box.values).cast<Done>();
            return Container(
              child: dones.isEmpty
                  ? Center(
                      child: Text('The list is Empty!'),
                    )
                  : ListView.builder(
                      itemCount: dones.length,
                      itemBuilder: (context, i) => ListTile(
                        title: Text(dones[i].done),
                      ),
                    ),
            );
          },
        ),
        Positioned(
          right: 15,
          bottom: 10,
          child: OutlinedButton(
            child: Text('Clear list'),
            onPressed: () {
              if (Boxes.getDones().isNotEmpty) {
                Boxes.getDones().clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('List cleared successfuly'),
                    duration: Duration(milliseconds: 600),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
