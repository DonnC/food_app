// @author:     Donald Chinhuru <https://github.com/DonnC>
// @created:    06 Jan 2021
// @objective:  momentum auth service to connect to backend server

import 'package:momentum/momentum.dart';

class AuthService extends MomentumService {
  Future login(String email, String password) async {
    // TODO: implement login user to server

    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future signup(String username, String email, String password) async {
    // TODO: implement signup user to server

    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future forgotPassword(String email) async {
    // TODO: implement forgot user-pwd to server

    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future<bool> logout() async {
    // TODO: implement logout

    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
