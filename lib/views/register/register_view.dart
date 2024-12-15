import 'package:dsw54167/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/my_images.dart';
import '../login/login_view.dart';
import '../widgets/basic_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: IconButton(
                      icon: Image.asset(MyImages.back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Image.asset(MyImages.cornerDetail),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 85),
                    sectionText('Sign Up'),
                    const SizedBox(height: 46),
                    const BasicTextFormField(
                      initialValue: "Full Name",
                      prefixIcon: MyImages.user,
                    ),
                    const SizedBox(height: 40),
                    const BasicTextFormField(
                      initialValue: "Email",
                      prefixIcon: MyImages.envelope,
                    ),
                    const SizedBox(height: 40),
                    const BasicTextFormField(
                      initialValue: "Password",
                      prefixIcon: MyImages.padlock,
                      suffixIcon: MyImages.eye,
                    ),
                    const SizedBox(height: 40),
                    const BasicTextFormField(
                      initialValue: "Confirm Password",
                      prefixIcon: MyImages.padlock,
                      suffixIcon: MyImages.eye,
                    ),
                    const SizedBox(height: 80),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(MyColors.anotherPink),
                            shape:
                                WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                            foregroundColor:
                                WidgetStateProperty.all(MyColors.white)),
                        onPressed: () {},
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
              bottomText('Already have an account? ', context,
                  (context) => const LoginView(), 'Sign In'),
              SizedBox(
                height: 62,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
