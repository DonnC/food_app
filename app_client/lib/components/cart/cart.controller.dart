import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class CartController extends MomentumController<CartModel> {
  @override
  CartModel init() {
    return CartModel(
      this,
      cart: List<Cart>.empty(growable: true),
    );
  }

  void addToCart(Cart cart) {
    // FIXME: Avoid redundancy
    final _cart = model.cart;
    _cart.add(cart);
    model.update(cart: _cart);
    print('[INFO] Product added to cart: ${model.cart.length}');
  }

  double get totalPrice {
    double _totalPrice = 0.00;

    final _productsInCart = model.cart;

    for (var cartProduct in _productsInCart) {
      _totalPrice += cartProduct.product.price * cartProduct.quantity;
    }

    return _totalPrice;
  }

  void deleteCartProduct(Cart cart) {
    // FIXME: Avoid redundancy
    final _cart = model.cart;
    _cart.remove(cart);
    model.update(cart: _cart);
  }
}
