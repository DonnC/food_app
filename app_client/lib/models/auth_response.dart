import 'package:restaurant_app/constants/index.dart';

/// response model for [AuthService] service
class AuthResponse {
  final AuthResponseAction action;
  final String message;
  final data;

  AuthResponse({
    this.action,
    this.message,
    this.data,
  });
  
}
