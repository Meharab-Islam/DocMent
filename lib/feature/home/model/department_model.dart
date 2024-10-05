class DepartmentModel {
  final int id;
  final List<Translation> translations;

  DepartmentModel({required this.id, required this.translations});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      translations: (json['translations'] as List)
          .map((e) => Translation.fromJson(e))
          .toList(),
    );
  }
}

class Translation {
  final int departmentId;
  final String name;

  Translation({required this.departmentId, required this.name});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      departmentId: json['department_id'],
      name: json['name'],
    );
  }
}
