import 'package:momentum/momentum.dart';
import 'package:restaurant_app/constants/index.dart';

import 'index.dart';

class OrderPageModel extends MomentumModel<OrderPageController> {
  OrderPageModel(
    OrderPageController controller, {
    this.coupon,
    this.tax,
    this.loading,
    this.payMethod,
  }) : super(controller);

  final PaymentMethods payMethod;
  final String coupon;
  final double tax;
  final bool loading;

  @override
  void update({
    String coupon,
    double tax,
    bool loading,
    PaymentMethods payMethod,
  }) {
    OrderPageModel(
      controller,
      coupon: coupon ?? this.coupon,
      tax: tax ?? this.tax,
      loading: loading ?? this.loading,
      payMethod: payMethod,
    ).updateMomentum();
  }
}
