import 'package:momentum/momentum.dart';

import 'index.dart';

class OrderPageController extends MomentumController<OrderPageModel> {
  @override
  OrderPageModel init() {
    return OrderPageModel(
      this,
      coupon: '',
      tax: 15.00,
      loading: false,
    );
  }

  // bootstrap to get latest taxation fee

  Future<void> processOrder(var cartProducts) async {
    // TODO: process order
  }
}
