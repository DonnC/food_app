import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/constants/index.dart';

class PaymentMethodModel {
  final PaymentMethods paymentMethod;
  final String name;
  final icon; // can be image / icon

  PaymentMethodModel({
    this.paymentMethod,
    this.name,
    this.icon,
  });

  static List<PaymentMethodModel> get orderPaymentMethods => [
        PaymentMethodModel(
          paymentMethod: PaymentMethods.CreditCard,
          name: 'Credit Card',
          icon: LineIcons.cc_mastercard,
        ),
        PaymentMethodModel(
          paymentMethod: PaymentMethods.Paypal,
          name: 'Paypal',
          icon: LineIcons.cc_paypal,
        ),
        PaymentMethodModel(
          paymentMethod: PaymentMethods.GooglePay,
          name: 'Google Pay',
          icon: LineIcons.google_wallet,
        ),
      ];
}
