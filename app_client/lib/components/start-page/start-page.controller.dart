import 'package:momentum/momentum.dart';

import 'index.dart';

class StartPageController extends MomentumController<StartPageModel> {
  @override
  StartPageModel init() {
    return StartPageModel(
      this,
      selectedPageIndex: 0,
      appBarTitle: '',
    );
  }
}
