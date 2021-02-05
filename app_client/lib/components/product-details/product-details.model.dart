import 'package:momentum/momentum.dart';

import 'index.dart';

class ProductDetailsModel extends MomentumModel<ProductDetailsController> {
  ProductDetailsModel(
    ProductDetailsController controller, {
    this.cartProductCounter,
    this.isFavorite,
  }) : super(controller);

  final int cartProductCounter;
  final bool isFavorite;

  @override
  void update({
    int cartProductCounter,
    bool isFavorite,
  }) {
    ProductDetailsModel(
      controller,
      isFavorite: isFavorite ?? this.isFavorite,
      cartProductCounter: cartProductCounter ?? this.cartProductCounter,
    ).updateMomentum();
  }
}
