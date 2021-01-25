import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:restaurant_app/models/index.dart';

class Favorites {
  final List<Product> favorites;
  
  Favorites({
    this.favorites,
  });

  Favorites copyWith({
    List<Product> favorites,
  }) {
    return Favorites(
      favorites: favorites ?? this.favorites,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'favorites': favorites?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Favorites.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Favorites(
      favorites: List<Product>.from(map['favorites']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorites.fromJson(String source) => Favorites.fromMap(json.decode(source));

  @override
  String toString() => 'Favorites(favorites: $favorites)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Favorites &&
      listEquals(o.favorites, favorites);
  }
}
