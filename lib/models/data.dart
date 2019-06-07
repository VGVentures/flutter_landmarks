import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:landmarks_flutter/models/landmark.dart';

List<Landmark> _landmarkData;

List<Landmark> get allLandmarks => _landmarkData;

List<Landmark> get favoriteLandmarks => _landmarkData.where((l) => l.isFavorite).toList();

Future<T> _load<T>(String filename, T Function(dynamic) builder) async {
  final fileString = await rootBundle.loadString('assets/$filename');
  return builder(json.decode(fileString));
}

Future<Null> loadData() async {
  _landmarkData = await _load('landmarkData.json', (data) => List.unmodifiable((data).map((element) => Landmark.fromJSON(element))));
}
