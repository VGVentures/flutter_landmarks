import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:landmarks_flutter/models/landmark.dart';

final List<Landmark> landmarkData = load('landmarkData.json');

T load<T>(String filename) {
  print(rootBundle.loadString(filename));
}