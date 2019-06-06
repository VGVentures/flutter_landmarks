import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:landmarks_flutter/models/landmark.dart';

List<Landmark> _landmarkData;

List<Landmark> get allLandmarks => _landmarkData;

List<Landmark> get favoriteLandmarks => _landmarkData.where((l) => l.isFavorite).toList();

Future<Null> loadData() async {
  final string = await rootBundle.loadString('assets/landmarkData.json');
  final data = json.decode(string);
  _landmarkData = List.unmodifiable(data.map((map) => Landmark.fromJSON(map)));
}
