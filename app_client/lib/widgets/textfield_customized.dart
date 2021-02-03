import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/utils/index.dart';

Widget customTextField({
  TextEditingController controller,
  String validateError,
  String hintText,
  TextInputType keyboardType: TextInputType.text,
  int maxLines: 1,
  bool obscureText: false,
  String labelText: '',
  Widget suffixIcon: const SizedBox(),
}) {
  const double _radius = 18;

  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
        color: loginUpperColor,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: TextFormField(
        cursorColor: Colors.white60,
        style: TextStyle(
          color: Colors.white60,
        ),
        maxLines: maxLines,
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return validateError;
          }
          return null;
        },
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: loginUpperColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide(
              color: loginUpperColor,
            ),
          ),
          hintText: hintText,
          labelStyle: TextStyle(
            color: textColor,
            fontSize: 13,
            height: 3,
          ),
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
      ),
    ),
  );
}
