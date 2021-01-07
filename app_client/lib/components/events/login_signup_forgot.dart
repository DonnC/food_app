// login, sign, forgot pwd event class

import 'package:restaurant_app/constants/index.dart';

class AuthEvent {
  final AuthEventAction action;
  final String title;
  final String message;

  AuthEvent({this.action, this.title, this.message});
}
