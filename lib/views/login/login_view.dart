import 'package:dsw54167/utils/my_images.dart';
import 'package:dsw54167/views/register/register_view.dart';
import 'package:dsw54167/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var login;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 62),
                Image.asset(MyImages.logo),
                const SizedBox(height: 21),
                _signInText(),
                ElevatedButton(
                  child: const Text('Open route'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()),
                    );
                  },
                ),
                const BasicTextFormField(initialValue: "email"),
                _dontHaveAccountText(context),
                const SizedBox(height: 62),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _signInText() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Sign in',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: MyColors.purple),
    ),
  );
}

Widget _dontHaveAccountText(BuildContext context) {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('don\'t have account? ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.purple)),
            Text('Sign up',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: MyColors.purple)),
          ],
        ),

        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterView()),
          ),
        },
      ),
    ),
  );
}
