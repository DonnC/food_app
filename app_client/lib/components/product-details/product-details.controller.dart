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

  void _checkFavorite() {
    bool _res;

    final _favController = dependOn<FavoritesController>();

    final Product _product = getParam<ProductDetailsPageParam>().product;

    if (_favController.model.favorites == null ||
        _favController.model.favorites.isEmpty) {
      _res = false;
    } else {
      try {
        _favController.model.favorites
            .where((favProduct) => favProduct.id == _product.id)
            .first;

        _res = true;
      } catch (StateError) {
        _res = false;
      }
    }

    model.update(isFavorite: _res);
  }

  void _removeFavorite() {
    final _favController = dependOn<FavoritesController>();

    final Product _product = getParam<ProductDetailsPageParam>().product;

    _favController.deleteFavorite(_product);

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
    final _cartController = dependOn<CartController>();

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
        message: 'product added to cart successfully',
      ),
    );
  }

  void addToFavorites() {
    final _favController = dependOn<FavoritesController>();

    final Product _product = getParam<ProductDetailsPageParam>().product;

    // toggle favorite model
    _checkFavorite();

    if (model.isFavorite) {
      _removeFavorite();

      sendEvent(
        ProductDetailsEvent(
          action: ProductDetailsEventAction.Success,
          message: 'product successfully removed from your favorites',
        ),
      );
    }

    // add to cart
    else {
      _favController.addToFavorites(_product);

      sendEvent(
        ProductDetailsEvent(
          action: ProductDetailsEventAction.Success,
          message: 'product successfully added to your favorites',
        ),
      );
    }
  }
}
