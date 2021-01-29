import 'package:restaurant_app/constants/index.dart';

class ProductDetailsEvent {
  final ProductDetailsEventAction action;
  final String message;
  final String title;

  ProductDetailsEvent({
    this.action,
    this.message,
    this.title,
  });
}
