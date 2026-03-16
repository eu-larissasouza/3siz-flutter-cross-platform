import 'package:marauders_app/data/repositories/character_repository_impl.dart';
import 'package:marauders_app/domain/entities/character_entity.dart';

class GetCharactersUsecase {
  final CharacterRepositoryImpl repository;

  GetCharactersUsecase(this.repository);

  Future<List<CharacterEntity>> execute() async {
    final characters = await repository.getCharacters();

    if (characters.isEmpty) {
      throw Exception("Nenhum personagem encontrado no mapa!");
    }
    return characters;
  }
}
