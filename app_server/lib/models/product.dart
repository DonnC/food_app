import 'package:app_server/app_server.dart';

import 'index.dart';

class Product extends ManagedObject<_Product> implements _Product {}

class _Product {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  @Column()
  String description;

  @Column()
  double price;

  @Column()
  double calories;

  @Column()
  int minTime;

  @Column()
  int maxTime;

  @Column(defaultValue: "0.0")
  double votes;

  @Column()
  double mass;

  @Column()
  String category;

  @Column()
  String imageUrl;

  @Column()
  String contents;

  @Relate(#favorites)
  User user;
}