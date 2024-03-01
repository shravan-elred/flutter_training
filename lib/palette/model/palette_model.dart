class PaletteModel {
  const PaletteModel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory PaletteModel.fromMap(Map<String, dynamic> map) {
    return PaletteModel(
      id: map['id'] as int,
      name: map['name'] as String,
      year: map['year'] as int,
      color: map['color'] as String,
      pantoneValue: map['pantone_value'] as String,
    );
  }

  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'year': year,
      'color': color,
      'pantoneValue': pantoneValue,
    };
  }
}
