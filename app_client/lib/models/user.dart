import 'dart:convert';

import 'index.dart';

class User {
  int id;
  String username;
  String email;
  String address;
  String contact;
  String paymentMethod; // FIXME: fix type
  List<Product> favorites;
  List<Order> orders;
  List<Notification> notifications;

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

  /// get default user for [UserProfileController] persistence
  static User get defaultEmptyUser => User(
        id: 0,
        username: 'DonnC Lab',
        email: 'donnclab@gmail.com',
        address: 'Harare, Zimbabwe',
        contact: '0778 060 126',
        paymentMethod: 'Credit Card, Ecocash',
        favorites: List<Product>.empty(growable: true),
        orders: List<Order>.empty(growable: true),
        //notifications: List<Notification>.empty(growable: true),
        notifications: <Notification>[
          Notification(
            points: 20,
            notifiedOn: DateTime(2021, 2, 1, 10, 30),
          ),
          Notification(
            points: 30,
            notifiedOn: DateTime.now(),
          ),
          Notification(
            points: 70,
            notifiedOn: DateTime(2021, 1, 2, 10, 30),
          ),
          Notification(
            points: 20,
            notifiedOn: DateTime(2021, 1, 3, 17, 23),
          ),
          Notification(
            points: 10,
            notifiedOn: DateTime(2021, 1, 5, 07, 30),
          ),
          Notification(
            points: 17,
            notifiedOn: DateTime(2021, 1, 13, 14, 37),
          ),
          Notification(
            points: 57,
            notifiedOn: DateTime(2021, 1, 25, 18, 12),
          ),
        ],
      );

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
      favorites:
          List<Product>.from(map['favorites']?.map((x) => Product.fromMap(x))),
      orders: List<Order>.from(map['orders']?.map((x) => Order.fromMap(x))),
      notifications: List<Notification>.from(
          map['notifications']?.map((x) => Notification.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, address: $address, contact: $contact, paymentMethod: $paymentMethod, favorites: $favorites, orders: $orders, notifications: $notifications)';
  }
}
