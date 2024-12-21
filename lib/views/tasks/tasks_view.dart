import 'package:dsw54167/views/add_view.dart';
import 'package:dsw54167/views/login/login_view.dart';
import 'package:dsw54167/views/sharedPreferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              _clickableContainer(context, "mecz", "wtorek 19:00"),
              _clickableContainer(context, "zakupy", "sobota więc do lidla do lida"),
              _clickableContainer(context, "basen", "niedziela 8:00"),
              Container(
                height: 50,
                color: Colors.amber[500],
                child: const Center(child: Text('Entry C')),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  AddView(null, null)));
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

Widget _clickableContainer(BuildContext context, String title, String desc) {
  return  InkWell(
    child: Container(
      height: 50,
      color: Colors.amber[600],
      child: Text(
        title
      ),
    ),
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  AddView(title, desc)))
    },
  );
}


