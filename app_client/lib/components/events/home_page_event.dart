import 'package:restaurant_app/constants/index.dart';

class HomePageEvent {
  final HomePageEventAction action;
  final String message;
  final String title;

  HomePageEvent({
    this.action,
    this.message,
    this.title,
  });
}
