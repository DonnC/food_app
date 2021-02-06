import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/services/index.dart';
import 'package:restaurant_app/widgets/index.dart';

import 'index.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends MomentumState<CartPage> {
  CartController _cartController;
  DialogService _dialogService;

  @override
  void initMomentumState() {
    _cartController = Momentum.controller<CartController>(context);
    _dialogService = Momentum.service<DialogService>(context);

    _cartController.listen<CartEvent>(
      state: this,
      invoke: (event) {
        switch (event.action) {
          case CartEventAction.Success:
            _dialogService.showFloatingFlushbar(
              context: context,
              title: event.title,
              message: event.message,
            );
            break;
          default:
        }
      },
    );

    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: LayoutBuilder(
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
                            ? emptyWidget(
                                height: _h,
                                width: _w,
                                message: 'Your cart is empty',
                                icon: LineIcons.shopping_cart,
                              )
                            : Column(
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      final Cart product = _model.cart[index];

                                      return cartCard(
                                        product: product,
                                        onTapCallback: () => _model.controller
                                            .deleteCartProduct(index),
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
                  lowerBottomWidget(
                    buttonText: 'Next',
                    width: _w,
                    price: (_model.controller.totalPrice).toStringAsFixed(2),
                    isEmptyForCart: _model.cart.isEmpty,
                    onButtonTap: () =>
                        MomentumRouter.goto(context, OrderPaymentPage),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
