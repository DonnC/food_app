// @author:     Donald Chinhuru <https://github.com/DonnC>
// @created:    06 Jan 2021
// @objective:  momentum auth service to connect to backend server

import 'package:momentum/momentum.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';

class AuthService extends MomentumService {
  /// returns [User] on successful login
  Future<AuthResponse> login(String email, String password) async {
    // TODO: implement login user to server

    await Future.delayed(Duration(seconds: 3));

    // return [User] on `data` field on successful login
    return AuthResponse(
      action: AuthResponseAction.Success,
      message: 'login successful',
      data: User(
        id: 0,
        username: '',
        email: '',
        address: '',
        contact: '',
        paymentMethod: '',
        favorites: List<Product>.empty(growable: true),
        orders: List<Order>.empty(growable: true),
        notifications: List<Notification>.empty(growable: true),
      ),
    );
  }

  /// sign-up and returns [User] on successful sign up
  Future<AuthResponse> signup(
      String username, String email, String password) async {
    // TODO: implement signup user to server

    await Future.delayed(Duration(seconds: 3));

    return AuthResponse(
      action: AuthResponseAction.Success,
      message: 'signup successful',
      data: User(
        id: 0,
        username: '',
        email: '',
        address: '',
        contact: '',
        paymentMethod: '',
        favorites: List<Product>.empty(growable: true),
        orders: List<Order>.empty(growable: true),
        notifications: List<Notification>.empty(growable: true),
      ),
    );
  }

  Future<AuthResponse> forgotPassword(String email) async {
    // TODO: implement forgot user-pwd to server

    await Future.delayed(Duration(seconds: 3));

    return AuthResponse(
      action: AuthResponseAction.Success,
      message:
          'Password reset instructions successfully sent to your email. Please check your email',
    );
  }

  Future<bool> logout() async {
    // TODO: implement logout

    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
