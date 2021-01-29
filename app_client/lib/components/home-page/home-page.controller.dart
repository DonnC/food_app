import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/services/index.dart';

import 'index.dart';

class HomePageController extends MomentumController<HomePageModel> {
  @override
  HomePageModel init() {
    return HomePageModel(
      this,
      selectedIndex: 0,
      loading: false,
      products: List<Product>.empty(growable: true),
    );
  }

  @override
  Future<void> bootstrapAsync() async {
    await loadAllProducts();
  }

  Future<void> loadAllProducts() async {
    final _productService = getService<ProductService>();

    model.update(loading: true);

    var _products = await _productService.fetchAllProducts();

    if (_products == null) {
      sendEvent(
        HomePageEvent(
          action: HomePageEventAction.Error,
          message: 'Failed to load food products',
          title: 'error',
        ),
      );
    }

    model.update(products: _products, loading: false);
  }
}
