class LocationModel {
  final int id;
  final List<Translation> translations;

  LocationModel({required this.id, required this.translations});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      translations: (json['translations'] as List)
          .map((e) => Translation.fromJson(e))
          .toList(),
    );
  }
}

class Translation {
  final int locationId;
  final String name;

  Translation({required this.locationId, required this.name});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      locationId: json['location_id'],
      name: json['name'],
    );
  }
}
