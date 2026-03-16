import 'package:flutter/material.dart';
import 'package:marauders_app/domain/entities/character_entity.dart';
import 'package:marauders_app/domain/usecases/get_characters_usecase.dart';

class CharacterController extends ChangeNotifier {
  final GetCharactersUsecase _getCharactersUsecase;

  CharacterController(this._getCharactersUsecase);

  List<CharacterEntity> _characters = [];

  bool isLoading = false;
  String? error;

  List<CharacterEntity> get characters => _characters;

  Future<void> fetchCharacters() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      _characters = await _getCharactersUsecase.execute();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
