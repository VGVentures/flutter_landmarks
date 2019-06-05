import 'package:flutter/foundation.dart';

enum Category {
  featured,
  lakes,
  rivers,
  mountains,
}

class Landmark extends ChangeNotifier {
  final int id;
  final String name;
  final String imageName;
  final Coordinates coordinates;
  final String state;
  final String park;
  final Category category;
  bool isFavorite;

  Landmark({
    this.id,
    this.name,
    this.imageName,
    this.coordinates,
    this.state,
    this.park,
    this.category,
    this.isFavorite,
  });

  void setFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  factory Landmark.fromJSON(Map map) {
    return Landmark(
      id: map['id'],
      name: map['name'],
      imageName: map['imageName'],
      coordinates: Coordinates.fromJSON(map['coordinates']),
      state: map['state'],
      park: map['park'],
      category: _categoryFromString(map['category']),
      isFavorite: map['isFavorite'],
    );
  }

  static Category _categoryFromString(String input) {
    return Category.values.firstWhere((c) {
      final value = c.toString().split('.')[1];
      return value == input.toLowerCase();
    });
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJSON(Map map) {
    return Coordinates(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
