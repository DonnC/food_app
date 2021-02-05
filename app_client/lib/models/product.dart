import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double calories;
  final int minTime; // time e.g 15 - 30 min [minTime - maxTime]
  final int maxTime;
  final double votes;
  final double mass;
  final String category;
  final String imageUrl;
  final String contents; // food contents
  
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.calories,
    this.minTime,
    this.maxTime,
    this.votes,
    this.mass,
    this.category,
    this.imageUrl,
    this.contents,
  });

  Product copyWith({
    int id,
    String name,
    String description,
    double price,
    double calories,
    int minTime,
    int maxTime,
    double votes,
    double mass,
    String category,
    String imageUrl,
    String contents,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      calories: calories ?? this.calories,
      minTime: minTime ?? this.minTime,
      maxTime: maxTime ?? this.maxTime,
      votes: votes ?? this.votes,
      mass: mass ?? this.mass,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'calories': calories,
      'minTime': minTime,
      'maxTime': maxTime,
      'votes': votes,
      'mass': mass,
      'category': category,
      'imageUrl': imageUrl,
      'contents': contents,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      calories: map['calories'],
      minTime: map['minTime'],
      maxTime: map['maxTime'],
      votes: map['votes'],
      mass: map['mass'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      contents: map['contents'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, calories: $calories, minTime: $minTime, maxTime: $maxTime, votes: $votes, mass: $mass, category: $category, imageUrl: $imageUrl, contents: $contents)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Product &&
      o.id == id &&
      o.name == name &&
      o.description == description &&
      o.price == price &&
      o.calories == calories &&
      o.minTime == minTime &&
      o.maxTime == maxTime &&
      o.votes == votes &&
      o.mass == mass &&
      o.category == category &&
      o.imageUrl == imageUrl &&
      o.contents == contents;
  }
}
