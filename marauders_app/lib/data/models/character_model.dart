import 'package:marauders_app/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.name,
    required super.species,
    required super.house,
    required super.isWizard,
    required super.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json["name"] ?? "Unknown",
      species: json["species"],
      house: json["house"],
      isWizard: json["isWizard"] ?? false,
      image: json["image"],
    );
  }
}
