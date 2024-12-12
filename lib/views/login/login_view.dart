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
                const SizedBox(height: 46),
                const BasicTextFormField(
                  initialValue: "Email or User Name",
                  icon: MyImages.user,
                ),
                const SizedBox(height: 40),
                const BasicTextFormField(
                  initialValue: "Password",
                  icon: MyImages.locker,
                ),
                const SizedBox(height: 40),
                _forgetPasswordText(),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(MyColors.anotherPink),
                      shape: WidgetStateProperty.all( RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                      )),
                      foregroundColor: WidgetStateProperty.all(MyColors.white)

                    ),
                    onPressed: () {},
                    child: const Text('Sign in'),
                  ),
                ),
                _signUpText(context),
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

Widget _forgetPasswordText() {
  return Align(
    alignment: Alignment.centerRight,
    child: Text(
      'Forgot Password?',
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w700, color: MyColors.purple),
    ),
  );
}

Widget _signUpText(BuildContext context) {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('don\'t have account? ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.purple)),
            GestureDetector(
              child: Text('Sign up',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.purple)),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterView()),
                ),
              },
            ),
          ],
        ),
      ),
    ),
  );
}
