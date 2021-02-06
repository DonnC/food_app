import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/index.dart';

Widget lowerBottomWidget({
  double leftPadding: 15,
  double bottomPadding: 5,
  bool isEmptyForCart: false, // show or hide cart button when cart is empty
  String buttonText,
  double width,
  String price,
  var onButtonTap,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: leftPadding,
      right: 15,
      bottom: bottomPadding,
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$$price',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Spacer(),
        isEmptyForCart
            ? SizedBox()
            : FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                minWidth: width * 0.5,
                height: 45,
                color: buttonBgColor,
                onPressed: onButtonTap,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
      ],
    ),
  );
}
