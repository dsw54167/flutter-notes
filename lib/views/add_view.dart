import 'package:dsw54167/views/tasks/tasks_view.dart';
import 'package:flutter/material.dart';

import '../db/note_database.dart';
import '../model/note.dart';

class AddView extends StatefulWidget {
  final Note note;

  const AddView(this.note, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddViewState(note);
  }
}

class _AddViewState extends State<AddView> {
  Note note;

  _AddViewState(this.note);

  Future addNote() async {
    var isUpdate = widget.note.id != null ? true : false;
    if (isUpdate)
      await NotesDatabase.instance.update(note);
    else
      await NotesDatabase.instance.create(note);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 62),
            TextFormField(
              initialValue: note.title ?? "Title",
              onChanged: (value) => setState(() {
                note.title = value;
              }),
            ),
            const SizedBox(height: 62),
            TextFormField(
              maxLines: 10,
              initialValue: note.description ?? "Description",
              onChanged: (value) => setState(() {
                note.description = value;
              }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNote();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TasksView()));
          },
          child: const Icon(Icons.save),
        ),
        bottomNavigationBar: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TasksView()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
    ));
  }
}
