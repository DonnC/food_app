import 'dart:convert';

import 'index.dart';

class Notification {
  final Order order;
  final int points;

  Notification({
    this.order,
    this.points: 0,
  });

 

  Notification copyWith({
    Order order,
    int points,
  }) {
    return Notification(
      order: order ?? this.order,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'order': order?.toMap(),
      'points': points,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Notification(
      order: Order.fromMap(map['order']),
      points: map['points'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source));

  @override
  String toString() => 'Notification(order: $order, points: $points)';
}
