import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class FavoritesController extends MomentumController<FavoritesModel> {
  @override
  FavoritesModel init() {
    return FavoritesModel(
      this,
      favorites: List<Product>.empty(growable: true),
      loading: false,
    );
  }

  void addToFavorites(Product product) {
    final _favorites = model.favorites;
    _favorites.add(product);

    model.update(favorites: _favorites);
  }

  void deleteFavorite(Product product) {
    final _favorites = model.favorites;
    
    _favorites.remove(product);

    model.update(favorites: _favorites);
  }
}
