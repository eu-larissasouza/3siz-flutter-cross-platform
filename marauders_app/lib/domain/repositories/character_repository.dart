import 'package:marauders_app/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacters();
}
