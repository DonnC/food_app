import 'dart:convert';

import 'index.dart';
class Order {
  final int id;
  final DateTime date;
  final String coupon;          // coupon applied on this order
  final String paymentMethod;
  final List<Cart> products; // products are from cart to order page
  final double taxation;    // tax applied on this order

  Order({
    this.id,
    this.date,
    this.coupon,
    this.paymentMethod,
    this.products,
    this.taxation,
  });

  Order copyWith({
    int id,
    DateTime date,
    String coupon,
    String paymentMethod,
    List<Cart> products,
    double taxation,
  }) {
    return Order(
      id: id ?? this.id,
      date: date ?? this.date,
      coupon: coupon ?? this.coupon,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      products: products ?? this.products,
      taxation: taxation ?? this.taxation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.millisecondsSinceEpoch,
      'coupon': coupon,
      'paymentMethod': paymentMethod,
      'products': products?.map((x) => x?.toMap())?.toList(),
      'taxation': taxation,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Order(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      coupon: map['coupon'],
      paymentMethod: map['paymentMethod'],
      products: List<Cart>.from(map['products']?.map((x) => Cart.fromMap(x))),
      taxation: map['taxation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, date: $date, coupon: $coupon, paymentMethod: $paymentMethod, products: $products, taxation: $taxation)';
  }
}
