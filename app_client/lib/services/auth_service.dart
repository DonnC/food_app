// @author:     Donald Chinhuru <https://github.com/DonnC>
// @created:    06 Jan 2021
// @objective:  momentum auth service to connect to backend server

import 'package:momentum/momentum.dart';

class AuthService extends MomentumService {
  final bool
      isFakeService; // know from AppServiceAlias<InjectService> if service is for fake data or not

  AuthService({
    this.isFakeService: false,
  });

  Future login(String email, String password) async {
    // TODO: implement login user to server
    if (isFakeService) {
      Future.delayed(Duration(milliseconds: 500));
      return true;
    } else {
      return null;
    }
  }

  Future signup(String username, String email, String password) async {
    // TODO: implement signup user to server
    if (isFakeService) {
      Future.delayed(Duration(milliseconds: 500));
      return true;
    } else {
      return null;
    }
  }

  Future forgotPassword(String email) async {
    // TODO: implement forgot user-pwd to server
    if (isFakeService) {
      Future.delayed(Duration(milliseconds: 500));
      return true;
    } else {
      return null;
    }
  }

  Future<bool> logout() async {
    // TODO: implement logout
    if (isFakeService) {
      Future.delayed(Duration(milliseconds: 500));
      return true;
    } else {
      return false;
    }
  }
}
