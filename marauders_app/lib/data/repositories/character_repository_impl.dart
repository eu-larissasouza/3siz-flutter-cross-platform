import 'package:marauders_app/data/datasources/character_datasource.dart';
import 'package:marauders_app/domain/entities/character_entity.dart';
import 'package:marauders_app/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl(this.datasource);

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    return await datasource.getCharacters();
  }
}
