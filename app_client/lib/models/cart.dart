import 'dart:convert';

import 'product.dart';

class Cart {
  final int quantity;
  final Product product;

  Cart({
    this.quantity: 1,
    this.product,
  });

  Cart copyWith({
    int quantity,
    Product product,
  }) {
    return Cart(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product?.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cart(
      quantity: map['quantity'],
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(quantity: $quantity, product: $product)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cart && o.quantity == quantity && o.product == product;
  }
}
