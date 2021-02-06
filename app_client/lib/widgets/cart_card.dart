import 'package:flutter/material.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/utils/index.dart';

Widget cartCard({
  Cart product,
  Function onTapCallback,
}) {
  return Container(
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: loginBgColor,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Center(
            child: Image.asset(
              // FIXME: Use network image
              product.product.imageUrl,
              fit: BoxFit.contain,
              height: 60,
              width: 60,
            ),
          ),
        ),
        SizedBox(width: 15),
        Text(
          '${product.quantity}x',
          style: TextStyle(
            color: textColor,
          ),
        ),
        SizedBox(width: 20),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.product.name,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.product.contents,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${(product.product.price).toStringAsFixed(2)}',
                style: TextStyle(
                  color: homePriceColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onTapCallback,
          child: CircleAvatar(
            backgroundColor: loginUpperColor,
            radius: 15,
            child: Center(
              child: Icon(
                Icons.close,
                size: 15,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
