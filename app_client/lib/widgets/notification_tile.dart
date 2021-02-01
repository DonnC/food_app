import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/index.dart';

Widget notificationTile({
  int points,
  int daysAgo,
  double w,
  bool isEven,
  Color oddColor,
}) {
  return Container(
    height: 100,
    width: w,
    color: isEven ? loginBgColor : oddColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 30,
            child: Center(
              child: Text(
                '+$points',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You earned $points points!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '$daysAgo days ago',
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
