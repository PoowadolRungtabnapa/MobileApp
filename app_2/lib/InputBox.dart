import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  Icon IconPlaceholder;
  String Placeholder;

  InputBox(this.IconPlaceholder, this.Placeholder);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.black12),
                borderRadius: BorderRadius.circular(15)),
            fillColor: Colors.black12,
            filled: true,
            prefixIcon: IconPlaceholder,
            border: InputBorder.none,
            labelText: Placeholder,
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).errorColor
                  : Colors.grey;
              return TextStyle(color: Colors.black54, fontSize: 12);
            }),
          ),
          validator: (String? value) {
            if (value == null || value == '') {
              return '';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
        ));
  }
}
