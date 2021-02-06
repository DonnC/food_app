import 'package:flutter/material.dart';

Widget emptyWidget({
  double height,
  double width,
  IconData icon,
  String message,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height * 0.3),
    child: Center(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: width * 0.2,
          ),
          SizedBox(height: 30),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ],
      ),
    ),
  );
}
