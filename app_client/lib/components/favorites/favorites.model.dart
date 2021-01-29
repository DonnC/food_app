import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class FavoritesModel extends MomentumModel<FavoritesController> {
  FavoritesModel(
    FavoritesController controller, {
    this.favorites,
    this.loading,
  }) : super(controller);

  final List<Product> favorites;
  final bool loading;

  @override
  void update({
    List<Product> favorites,
    bool loading,
  }) {
    FavoritesModel(
      controller,
      loading: loading ?? this.loading,
      favorites: favorites ?? this.favorites,
    ).updateMomentum();
  }
}
