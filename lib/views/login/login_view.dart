import 'package:dsw54167/utils/my_images.dart';
import 'package:dsw54167/views/register/register_view.dart';
import 'package:dsw54167/views/tasks/tasks_view.dart';
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
                sectionText('Sign in'),
                const SizedBox(height: 46),
                BasicTextFormField(
                  initialValue: "Email or User Name",
                  prefixIcon: MyImages.user,
                  validator: (value) {
                    return "user@gmail.com" == value ? null : 'Invalid email';
                  },
                ),
                const SizedBox(height: 40),
                BasicTextFormField(
                  initialValue: "Password",
                  prefixIcon: MyImages.padlock,
                  suffixIcon: MyImages.eye,
                  validator: (value) {
                    return "password" == value ? null : 'Invalid password';
                  },
                  maskInput: true,
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
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                        foregroundColor:
                            WidgetStateProperty.all(MyColors.white)),
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TasksView()));
                    },
                    child: const Text('Sign in'),
                  ),
                ),
                bottomText('don\'t have account?', context,
                    (context) => const RegisterView(), 'Sign up'),
                const SizedBox(height: 62),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget sectionText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
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

Widget bottomText(String displayText, BuildContext context,
    WidgetBuilder jumpToWidget, String activeText) {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$displayText ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.purple)),
            GestureDetector(
              child: Text(activeText,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.purple)),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: jumpToWidget),
                ),
              },
            ),
          ],
        ),
      ),
    ),
  );
}
