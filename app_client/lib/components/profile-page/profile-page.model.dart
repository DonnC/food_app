import 'package:momentum/momentum.dart';

import 'index.dart';

class ProfilePageModel extends MomentumModel<ProfilePageController> {
  ProfilePageModel(ProfilePageController controller) : super(controller);

  // TODO: add your final properties here...

  @override
  void update() {
    ProfilePageModel(
      controller,
    ).updateMomentum();
  }
}
