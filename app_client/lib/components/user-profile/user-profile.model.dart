import 'package:momentum/momentum.dart';

import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class UserProfileModel extends MomentumModel<UserProfileController> {
  UserProfileModel(
    UserProfileController controller, {
    this.user,
  }) : super(controller);

  final User user;

  @override
  void update({
    User user,
  }) {
    UserProfileModel(
      controller,
      user: user ?? this.user,
    ).updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toMap(),
    };
  }

  UserProfileModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserProfileModel(
      controller,
      user: User.fromMap(map['user']),
    );
  }
}
