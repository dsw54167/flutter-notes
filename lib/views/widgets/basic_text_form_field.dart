import 'package:dsw54167/utils/my_colors.dart';
import 'package:dsw54167/utils/my_images.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  final String initialValue;
  final String icon;

  const BasicTextFormField(
      {super.key, required this.initialValue, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.initialValue,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                  width: 2.0, color: MyColors.pink, style: BorderStyle.solid)),
          prefixIcon: Image.asset(this.icon)),
    );
  }
}
