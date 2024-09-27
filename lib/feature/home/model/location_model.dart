class Location {
  final int id;
  final List<Translation> translations;

  Location({
    required this.id,
    required this.translations,
  });

  // Factory method to create a Location object from JSON
  factory Location.fromJson(Map<String, dynamic> json) {
    var list = json['translations'] as List;
    List<Translation> translationsList =
        list.map((i) => Translation.fromJson(i)).toList();

    return Location(
      id: json['id'],
      translations: translationsList,
    );
  }

  // Method to convert a Location object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'translations': translations.map((translation) => translation.toJson()).toList(),
    };
  }
}

class Translation {
  final int locationId;
  final String name;

  Translation({
    required this.locationId,
    required this.name,
  });

  // Factory method to create a Translation object from JSON
  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      locationId: json['location_id'],
      name: json['name'],
    );
  }

  // Method to convert a Translation object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'location_id': locationId,
      'name': name,
    };
  }
}
