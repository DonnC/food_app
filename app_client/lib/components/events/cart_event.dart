import 'package:restaurant_app/constants/index.dart';

class CartEvent {
  final CartEventAction action;
  final String title;
  final String message;

  CartEvent({
    this.action,
    this.title,
    this.message,
  });
}
