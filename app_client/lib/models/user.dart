import 'dart:convert';

import 'index.dart';

class User {
  final int id;
  final String username;
  final String email;
  final String address;
  final String contact;
  final String paymentMethod; // FIXME: fix type
  final List<Product> favorites;
  final List<Order> orders;
  final List<Notification> notifications;

  User({
    this.id,
    this.username,
    this.email,
    this.address,
    this.contact,
    this.paymentMethod,
    this.favorites,
    this.orders,
    this.notifications,
  });

  User copyWith({
    int id,
    String username,
    String email,
    String address,
    String contact,
    String paymentMethod,
    List<Product> favorites,
    List<Order> orders,
    List<Notification> notifications,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      contact: contact ?? this.contact,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      favorites: favorites ?? this.favorites,
      orders: orders ?? this.orders,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'address': address,
      'contact': contact,
      'paymentMethod': paymentMethod,
      'favorites': favorites?.map((x) => x?.toMap())?.toList(),
      'orders': orders?.map((x) => x?.toMap())?.toList(),
      'notifications': notifications?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      address: map['address'],
      contact: map['contact'],
      paymentMethod: map['paymentMethod'],
      favorites: List<Product>.from(map['favorites']?.map((x) => Product.fromMap(x))),
      orders: List<Order>.from(map['orders']?.map((x) => Order.fromMap(x))),
      notifications: List<Notification>.from(map['notifications']?.map((x) => Notification.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, address: $address, contact: $contact, paymentMethod: $paymentMethod, favorites: $favorites, orders: $orders, notifications: $notifications)';
  }

}
