enum Category {
  featured,
  lakes,
  rivers,
  mountains,
}

class Landmark {
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

  factory Landmark.fromJSON(Map map) {
    return Landmark(
        id: map['id'],
        name: map['name'],
        imageName: map['imageName'],
        coordinates: Coordinates.fromJSON(map['coordinates']),
        state: map['state'],
        park: map['park'],
        category: Category.values.firstWhere((e) =>
            '${map['category']}'.toLowerCase() == (e.toString().split('.')[1])),
        isFavorite: map['isFavorite']);
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
