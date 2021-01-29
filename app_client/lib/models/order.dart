import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'index.dart';

class Order {
  final int id;
  final DateTime date;
  final String coupon;
  final String paymentMethod;
  final List<Product> products;

  Order({
    this.id,
    this.date,
    this.coupon: '',
    this.paymentMethod,
    this.products,
  });

  Order copyWith({
    int id,
    DateTime date,
    String coupon,
    String paymentMethod,
    List<Product> products,
  }) {
    return Order(
      id: id ?? this.id,
      date: date ?? this.date,
      coupon: coupon ?? this.coupon,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.millisecondsSinceEpoch,
      'coupon': coupon,
      'paymentMethod': paymentMethod,
      'products': products?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Order(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      coupon: map['coupon'],
      paymentMethod: map['paymentMethod'],
      products: List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, date: $date, coupon: $coupon, paymentMethod: $paymentMethod, products: $products)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Order &&
      o.id == id &&
      o.date == date &&
      o.coupon == coupon &&
      o.paymentMethod == paymentMethod &&
      listEquals(o.products, products);
  }
}
