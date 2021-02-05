// generate random fake info
import 'dart:math';

import 'package:restaurant_app/constants/index.dart';

final Random _random = Random();

int generateId() => _random.nextInt(99999).abs();

double generateCalories() =>
    _random.nextInt(150).abs().toDouble() + _random.nextDouble();

double generatePrice() =>
    10 + _random.nextInt(30).abs().toDouble() + _random.nextDouble();

int generateTime() => 5 + _random.nextInt(40).abs();

double generateVotes() =>
    1 + _random.nextInt(3).abs().toDouble() + _random.nextDouble();

double generateMass() =>
    50 + _random.nextInt(200).abs().toDouble() + _random.nextDouble();

String generateCategory() =>
    categories[_random.nextInt(categories.length).abs()];
