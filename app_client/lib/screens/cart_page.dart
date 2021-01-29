import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/utils/index.dart';

// TODO: Add time travel for undo and forward on delete cart product

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double _w = constraints.maxWidth;
        final double _h = constraints.maxHeight;
        final double _chipRadius = 40;

        return MomentumBuilder(
          controllers: [CartController],
          builder: (context, snapshot) {
            final _model = snapshot<CartModel>();

            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_chipRadius),
                    bottomRight: Radius.circular(_chipRadius),
                  ),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    width: _w,
                    height: _h * 0.85,
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: _model.cart.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: _h * 0.3),
                              child: Center(
                                child: Column(
                                  children: [
                                    Icon(
                                      LineIcons.shopping_cart,
                                      color: Colors.grey,
                                      size: _w * 0.2,
                                    ),
                                    SizedBox(height: 30),
                                    Text(
                                      'Your cart is empty',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final Cart product = _model.cart[index];

                                    return Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: loginBgColor,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                            onTap: () => _model.controller
                                                .deleteCartProduct(product),
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
                                  },
                                  separatorBuilder: (_, x) =>
                                      SizedBox(height: 30),
                                  itemCount: _model.cart.length,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 5,
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
                            '\$${(_model.controller.totalPrice).toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        minWidth: _w * 0.5,
                        height: 45,
                        color: buttonBgColor,
                        onPressed: () {},
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
