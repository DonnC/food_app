import 'package:momentum/momentum.dart';

import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class CartModel extends MomentumModel<CartController> {
  CartModel(
    CartController controller, {
    this.cart,
  }) : super(controller);

  final List<Cart> cart;

  @override
  void update({
    List<Cart> cart,
  }) {
    CartModel(
      controller,
      cart: cart ?? this.cart,
    ).updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'cart': cart?.map((x) => x?.toMap())?.toList(),
    };
  }

  CartModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return CartModel(
      controller,
      cart: List<Cart>.from(map['cart']?.map((x) => Cart.fromMap(x))),
    );
  }
}
