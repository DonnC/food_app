import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/utils/index.dart';

Widget profileRow({
  IconData icon,
  String title,
  String subtitle,
  Function onTapCallback,
}) {
  return Row(
    children: [
      Container(
        height: 55,
        width: 50,
        decoration: BoxDecoration(
          color: loginBgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 17,
            color: homePriceColor,
          ),
        ),
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
      Spacer(),
      GestureDetector(
        onTap: onTapCallback,
        child: CircleAvatar(
          backgroundColor: loginUpperColor,
          radius: 15,
          child: Center(
            child: Icon(
              LineIcons.pencil,
              size: 15,
              color: textColor,
            ),
          ),
        ),
      ),
    ],
  );
}
