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
      loading: false,
    );
  }

  @override
  void bootstrap() {
    // load dummy data on first call
    model.update(
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

    model.update(loading: true);

    await _service.updateUser(model.user);

    // TODO: send event on successful update

    model.update(loading: false);
  }

  Future<void> deleteUser() async {
    final _service = getService<UserService>();

    await _service.deleteUser(model.user);
  }

  void addToFavorites(Product product) {
    model.user.favorites.add(product);

    model.update();

    saveUserProfileChanges();
  }

  void removeFromFavorites(Product product) {
    model.user.favorites
        .removeWhere((favProduct) => favProduct.id == product.id);

    model.update();

    saveUserProfileChanges();
  }
}
