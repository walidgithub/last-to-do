import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget TextForm({
  //TextEditingController is the datatype
  //you can hover on attribute like (TextFormField) to know the datatype
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required FormFieldValidator validate,
  // ? because it isn't required
  String? hint,
  IconData? prefix,
  IconData? suffix,
  Function? onChanged,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: Icon(suffix),
        border: OutlineInputBorder(),
      ),
      // (s) is a parameter
      onChanged: (s) => onChanged,
      onTap: onTap,
    );

