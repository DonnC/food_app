// user related service to api (backend)
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';

class UserService extends MomentumService {
  /// update current user
  Future updateUser(User user) async {
    await Future.delayed(Duration(seconds: 5));

    return true;
  }

  /// deletes current logged in user profile
  Future deleteUser(User user) async {
    await Future.delayed(Duration(seconds: 5));

    return true;
  }

  
}
