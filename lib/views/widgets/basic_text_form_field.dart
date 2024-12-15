import 'package:dsw54167/utils/my_colors.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  final String initialValue;
  final String prefixIcon;
  final String? suffixIcon;

  const BasicTextFormField(
      {super.key,
      required this.initialValue,
      required this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        // disabledBorder: ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                width: 2.0, color: MyColors.pink, style: BorderStyle.solid)),
        prefixIcon: Image.asset(prefixIcon),
        suffixIcon: (suffixIcon != null ? Image.asset(suffixIcon!) : null),
      ),
    );
  }
}
