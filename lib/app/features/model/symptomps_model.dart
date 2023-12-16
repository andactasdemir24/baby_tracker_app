// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SymptopmsModel {
  final String image;
  final String name;

  SymptopmsModel({
    required this.image,
    required this.name,
  });

  SymptopmsModel copyWith({
    String? image,
    String? name,
  }) {
    return SymptopmsModel(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
    };
  }

  factory SymptopmsModel.fromMap(Map<String, dynamic> map) {
    return SymptopmsModel(
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SymptopmsModel.fromJson(String source) => SymptopmsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SymptopmsModel(image: $image, name: $name)';

  @override
  bool operator ==(covariant SymptopmsModel other) {
    if (identical(this, other)) return true;

    return other.image == image && other.name == name;
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode;
}
