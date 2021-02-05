import 'dart:convert';

class Notification {
  //final Order order;            // notification usually goes hand in hand with a particular order
  final int points;
  final DateTime notifiedOn;

  Notification({
    this.points,
    this.notifiedOn,
  });

  Notification copyWith({
    int points,
    DateTime notifiedOn,
  }) {
    return Notification(
      points: points ?? this.points,
      notifiedOn: notifiedOn ?? this.notifiedOn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'notifiedOn': notifiedOn?.millisecondsSinceEpoch,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Notification(
      points: map['points'],
      notifiedOn: DateTime.fromMillisecondsSinceEpoch(map['notifiedOn']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source));

  @override
  String toString() => 'Notification(points: $points, notifiedOn: $notifiedOn)';

}
