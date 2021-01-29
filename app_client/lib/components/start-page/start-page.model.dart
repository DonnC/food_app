import 'package:momentum/momentum.dart';

import 'index.dart';

class StartPageModel extends MomentumModel<StartPageController> {
  StartPageModel(
    StartPageController controller, {
    this.selectedPageIndex,
    this.appBarTitle,
  }) : super(controller);

  final int selectedPageIndex;
  final String appBarTitle;

  @override
  void update({
    int selectedPageIndex,
    String appBarTitle,
  }) {
    StartPageModel(
      controller,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
    ).updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedPageIndex': selectedPageIndex,
    };
  }

  StartPageModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return StartPageModel(
      controller,
      selectedPageIndex: map['selectedPageIndex'],
    );
  }
}
