import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
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

  double get totalPrice {
    double _totalPrice = 0.00;

    final _productsInCart = model.cart;

    for (var cartProduct in _productsInCart) {
      _totalPrice += cartProduct.product.price * cartProduct.quantity;
    }

    return _totalPrice;
  }

  void addToCart(Cart cart) {
    var _cartList = List<Cart>.from(model.cart);
    _cartList.add(cart);

    sendEvent(
      CartEvent(
        action: CartEventAction.Success,
        title: 'Add to Cart',
        message:
            '${cart.quantity}x ${cart.product.name} successfully added to cart',
      ),
    );

    model.update(cart: _cartList);
  }

  void deleteCartProduct(int cartAtIndex) {
    var _cartList = List<Cart>.from(model.cart);
    _cartList.removeAt(cartAtIndex);

    sendEvent(
      CartEvent(
        action: CartEventAction.Success,
        title: 'Cart',
        message: 'Product successfully deleted from cart',
      ),
    );
    model.update(cart: _cartList);
  }

  void undoCartDelete() {
    this.backward();
  }

  void redoCartDelete() {
    this.forward();
  }
}
