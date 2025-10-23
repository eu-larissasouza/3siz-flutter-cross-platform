import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_app/domain/explorer.dart';

// Parte mais inteligente do nosso codigo

// ChangeNotifier é uma classe do Flutter que permite notificar "ouvintes"
// (outros objetos ou widgets) quando o estado de um objeto muda

// setState alterava o estado completo do app

// view: executa regra de negocio
class HomeViewModel extends ChangeNotifier {
  final List<Explorer> listExplorers = [];

  void add(String name, String age) {
    final value = Explorer(name: name, age: int.parse(age));

    // preciso notificar que a lista foi alterada
    listExplorers.add(value);
    print(listExplorers);
    notifyListeners();
  }

  void remove(Explorer value) {
    listExplorers.remove(value);
    print(listExplorers);
    notifyListeners();
  }
}
