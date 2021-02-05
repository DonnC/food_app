import 'package:momentum/momentum.dart';

import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class UserProfileModel extends MomentumModel<UserProfileController> {
  UserProfileModel(
    UserProfileController controller, {
    this.user,
    this.loading,
  }) : super(controller);

  final User user;
  final bool loading;

  @override
  void update({
    User user,
    bool loading,
  }) {
    UserProfileModel(
      controller,
      user: user ?? this.user,
      loading: loading ?? this.loading,
    ).updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toMap(),
      'loading': loading,
    };
  }

  UserProfileModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserProfileModel(
      controller,
      user: User.fromMap(map['user']),
      loading: map['loading'],
    );
  }
}
