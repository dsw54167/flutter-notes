import 'package:dsw54167/views/tasks/tasks_view.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  final String? _title;
  final String? _description;

  AddView(this._title, this._description, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddViewState(_title, _description);
  }
}

class _AddViewState extends State<AddView> {
  String? title;
  String? desc;
  _AddViewState(this.title, this.desc);

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
              initialValue: title ?? "Title",
              onChanged: (value) => setState(() {
                this.title = value;
              }),
            ),
            const SizedBox(height: 62),
            TextFormField(
              maxLines: 10,
              initialValue: desc ?? "Description",
              onChanged: (value) => setState(() {
                this.desc = value;
              }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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
