import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:landmarks_flutter/models/landmark.dart';

List<Landmark> landmarkData;

Future<Null> loadData() async {
  landmarkData = await load(
    'landmarkData.json',
    (rawData) {
      return (rawData as List)
          .map<Landmark>((map) => Landmark.fromJSON(map))
          .toList();
    },
  );
}

Future<T> load<T>(String filename, T Function(dynamic) builder) async {
  final fileString = await rootBundle.loadString('assets/$filename');
  return builder(json.decode(fileString));
}
