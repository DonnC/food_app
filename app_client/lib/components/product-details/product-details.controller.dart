import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class ProductDetailsController extends MomentumController<ProductDetailsModel>
    with RouterMixin {
  @override
  ProductDetailsModel init() {
    return ProductDetailsModel(
      this,
      cartProductCounter: 1,
      isFavorite: false,
    );
  }

  @override
  void bootstrap() {
    _checkFavorite();
  }

  void checkFav() => _checkFavorite();

  void _checkFavorite() {
    final _userController = controller<UserProfileController>();

    final Product _product = getParam<ProductDetailsPageParam>().product;

    bool _res = false;

    if (_userController.model.user.favorites == null ||
        _userController.model.user.favorites.isEmpty) {
      _res = false;
    }

    // check if in fav list
    else {
      try {
        for (var favProduct in _userController.model.user.favorites) {
          if (favProduct.id == _product.id) {
            _res = true;
          }
        }
      } catch (e) {
        _res = false;
      }
    }

    model.update(isFavorite: _res);
  }

  void toggleFavorite() {
    final _userController = controller<UserProfileController>();

    final Product _product = getParam<ProductDetailsPageParam>().product;

    if (model.isFavorite) {
      _userController.removeFromFavorites(_product);
      sendEvent(
        ProductDetailsEvent(
          action: ProductDetailsEventAction.Success,
          message: '${_product.name} removed from your favorites',
          title: 'Favorite',
        ),
      );
    } else {
      _userController.addToFavorites(_product);
      sendEvent(
        ProductDetailsEvent(
          action: ProductDetailsEventAction.Success,
          message: '${_product.name} added to your favorites',
          title: 'Favorite',
        ),
      );
    }

    _checkFavorite();
  }

  void incrProductCounter() {
    final _value = model.cartProductCounter;
    model.update(cartProductCounter: _value + 1);
  }

  void decrProductCounter() {
    final _value = model.cartProductCounter;

    int val = _value - 1;

    if (val <= 0) {
      val = 1;
    }

    model.update(cartProductCounter: val);
  }

  void addToCart() {
    // dependency injection to grab [CartController]
    final _cartController = controller<CartController>();

    // grab product passed as parameter to this controller's view
    final Product _product = getParam<ProductDetailsPageParam>().product;

    final Cart _productToAdd = Cart(
      product: _product,
      quantity: model.cartProductCounter,
    );

    _cartController.addToCart(_productToAdd);

    sendEvent(
      ProductDetailsEvent(
        action: ProductDetailsEventAction.Success,
        message:
            '${model.cartProductCounter}x ${_product.name} added to cart successfully',
        title: 'Cart',
      ),
    );

    // reset cart counter
    model.update(cartProductCounter: 1);
  }
}
