import 'package:marauders_app/core/custom_http_client.dart';
import 'package:marauders_app/data/models/character_model.dart';
import 'package:marauders_app/domain/entities/character_entity.dart';

class CharacterDatasource {
  final CustomHttpClient httpClient;

  CharacterDatasource(this.httpClient);

  Future<List<CharacterEntity>> getCharacters() async {
    final response = await httpClient.getCharacters();

    return (response.data as List)
        .map((c) => CharacterModel.fromJson(c))
        .toList();
  }
}
