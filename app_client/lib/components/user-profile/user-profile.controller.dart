import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/services/index.dart';

import 'index.dart';

class UserProfileController extends MomentumController<UserProfileModel> {
  @override
  UserProfileModel init() {
    return UserProfileModel(
      this,
      user: User.defaultEmptyUser,
    );
  }

  void saveCurrentUser(User user) {
    model.update(user: user);
  }

  Future<void> saveUserProfileChanges() async {
    // commit changes permanently to api user backend
    // call userService to update user on backend
    final _service = getService<UserService>();

    await _service.updateUser(model.user);
  }

  Future<void> deleteUser() async {
    final _service = getService<UserService>();

    await _service.deleteUser(model.user);
  }

  void addToFavorites(Product product) {
    model.user.favorites.add(product);

    model.update();

    // TODO: call saveUserProfileChanges to save changes permanently
    // saveUserProfileChanges();
  }

  void removeFromFavorites(Product product) {
    model.user.favorites
        .removeWhere((favProduct) => favProduct.id == product.id);

    model.update();

    // TODO: save changes to backend api
    // saveUserProfileChanges();
  }
}
