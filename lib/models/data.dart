import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:landmarks_flutter/models/landmark.dart';

final List<Landmark> landmarkData = load('landmarkData.json', (rawData) {
  return (rawData as List)
      .map<Landmark>((map) => Landmark.fromJSON(map))
      .toList();
});

T load<T>(String filename, T Function(dynamic) builder) {
  rootBundle.loadString('assets/$filename').then((fileString) {
    return builder(json.decode(fileString));
  });
  return null;
}
