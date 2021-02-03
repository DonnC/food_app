import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:restaurant_app/widgets/index.dart';

class OrderPaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends MomentumState<OrderPaymentPage> {
  OrderPageController _orderPageController;
  TextEditingController _couponController;

  @override
  void initMomentumState() {
    _couponController = TextEditingController();

    _orderPageController = Momentum.controller<OrderPageController>(context);
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: Scaffold(
        backgroundColor: loginBgColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double _w = constraints.maxWidth;
            final double _h = constraints.maxHeight;
            final double _chipRadius = 40;

            return MomentumBuilder(
                controllers: [CartController, OrderPageController],
                builder: (context, snapshot) {
                  final _cartModel = snapshot<CartModel>();
                  final _orderModel = snapshot<OrderPageModel>();

                  return SafeArea(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(_chipRadius),
                            bottomRight: Radius.circular(_chipRadius),
                          ),
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            width: _w,
                            height: _h * 0.8,
                            child: SingleChildScrollView(
                              child: _cartModel.cart == null
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: _h * 0.3,
                                      ),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      MomentumRouter.pop(
                                                          context),
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: loginBgColor,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.chevron_left,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: _w * 0.2),
                                                Text(
                                                  'Payment',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(25),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, int index) {
                                              final PaymentMethodModel _pm =
                                                  PaymentMethodModel
                                                          .orderPaymentMethods[
                                                      index];

                                              return GestureDetector(
                                                onTap: () => _orderModel.update(
                                                  payMethod: _pm.paymentMethod,
                                                ),
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: _orderModel
                                                                .payMethod ==
                                                            _pm.paymentMethod
                                                        ? Colors.white
                                                        : Theme.of(context)
                                                            .primaryColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: textColor,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 10),
                                                      // TODO: use colored icon or image
                                                      Icon(
                                                        _pm.icon,
                                                        color: Colors.blueGrey,
                                                      ),
                                                      SizedBox(width: 20),
                                                      Text(
                                                        _pm.name,
                                                        style: TextStyle(
                                                          color: _orderModel
                                                                      .payMethod ==
                                                                  _pm.paymentMethod
                                                              ? Colors.black87
                                                              : Colors.white70,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value:
                                                            _pm.paymentMethod,
                                                        groupValue: _orderModel
                                                            .payMethod,
                                                        onChanged:
                                                            (paymentMethodChoice) =>
                                                                _orderModel
                                                                    .update(
                                                          payMethod:
                                                              paymentMethodChoice,
                                                        ),
                                                        activeColor: _orderModel
                                                                    .payMethod ==
                                                                _pm.paymentMethod
                                                            ? buttonBgColor
                                                            : textColor,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder: (context, x) =>
                                                SizedBox(height: 25),
                                            itemCount: PaymentMethodModel
                                                .orderPaymentMethods.length,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            'Add Coupon',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: customTextField(
                                            controller: _couponController,
                                            labelText: 'Coupon Code',
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 3),
                                              child: GestureDetector(
                                                onTap: () async =>
                                                    await Clipboard.getData(
                                                            'text/plain')
                                                        .then(
                                                  (value) => _couponController
                                                      .text = value.text,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Icon(
                                                    LineIcons.clipboard,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 15,
                                            top: 50,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Taxation',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '\$${(_orderModel.tax).toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 15,
                            bottom: 20,
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
                                    '\$${(_cartModel.controller.totalPrice + _orderModel.tax).toStringAsFixed(2)}',
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
                                onPressed: () async =>
                                    await _orderPageController
                                        .processOrder(_cartModel.cart),
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
