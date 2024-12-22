import 'package:dsw54167/db/note_database.dart';
import 'package:dsw54167/views/add_view.dart';
import 'package:dsw54167/views/login/login_view.dart';
import 'package:dsw54167/views/sharedPreferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../model/note.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  List<Note> notes = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();

    loadTasks();
  }

  void loadTasks() async {
    setState(() {
      loading = true;
    });
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() {
      loading = false;
    });
  }

  void removeTask(Note note) async {
    await NotesDatabase.instance.delete(note.id!);
    loadTasks();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('task deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: loading
              ? const CircularProgressIndicator()
              : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                      child: _clickableContainer(
                          context, notes[index], (direction) => removeTask(notes[index]))),
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddView(null)));
              loadTasks();
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: ElevatedButton(
              onPressed: () {
                LoginSupport().logoutUser();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              child: const Icon(Icons.logout)),
        ));
  }
}

Widget _clickableContainer(BuildContext context, Note note, removeTask) {
  return Dismissible(
    key: Key(note.title),
    onDismissed: removeTask,
    child: InkWell(
      child: Container(
        height: 50,
        color: Colors.amber[600],
        child: Text(note.title),
      ),
      onTap: () =>
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddView(note)))
      },
    ),
  );
}
