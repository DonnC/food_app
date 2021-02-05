import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/screens/index.dart';
import 'package:restaurant_app/utils/index.dart';

Widget productContainer({
  BuildContext context,
  Product product,
  CartController cartController,
}) {
  final _size = MediaQuery.of(context).size;

  return InkWell(
    onTap: () => MomentumRouter.goto(
      context,
      ProductDetailsPage,
      params: ProductDetailsPageParam(
        product: product,
      ),
    ),
    child: Container(
      width: _size.width * 0.5,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: loginBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Center(
              child: Image.asset(
                product.imageUrl,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            product.name,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 8),
          Text(
            product.contents,
            style: TextStyle(
              color: textColor,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                '\$${(product.price).toStringAsFixed(2)}',
                style: TextStyle(
                  color: homePriceColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => cartController.addToCart(Cart(product: product)),
                child: CircleAvatar(
                  backgroundColor: buttonBgColor,
                  child: Center(
                    child: Icon(
                      LineIcons.shopping_cart,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
