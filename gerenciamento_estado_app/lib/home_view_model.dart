import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_app/domain/patient.dart';

// Parte mais inteligente do nosso codigo

// ChangeNotifier é uma classe do Flutter que permite notificar "ouvintes"
// (outros objetos ou widgets) quando o estado de um objeto muda

// setState alterava o estado completo do app
class HomeViewModel extends ChangeNotifier {
  final List<Patient> listPatients = [];

  void add(String name, String age) {
    final value = Patient(name: name, age: int.parse(age));

    // preciso notificar que a lista foi alterada
    listPatients.add(value);
    notifyListeners();
  }

  void remove(Patient value) {
    listPatients.remove(value);
    notifyListeners();
  }
}
