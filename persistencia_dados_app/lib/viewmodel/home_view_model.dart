import 'package:flutter/material.dart';
import 'package:persistencia_dados_app/models/todo.dart';
import 'package:persistencia_dados_app/services/data_base_service.dart';
import 'package:sqflite/sqflite.dart';

// PARTE INTELIGENTE - VIEW: EXECUTA REGRA DE NEGÓCIO

// ChangeNotifier é uma classe do Flutter que permite notificar "ouvintes"
// (outros objetos ou widgets) quando o estado de um objeto muda

// setState alterava o estado completo do app

// Controla e faz o gerenciamento de estado usando o provider

class HomeViewModel extends ChangeNotifier {
  final DataBaseService _dataBaseService;
  List<Todo> todos = [];

  HomeViewModel(this._dataBaseService);

  void add(String value) async {
    final newTodo = Todo(title: value);
    await _dataBaseService.insertTodo(newTodo);
    fetchTodo();
  }

  void fetchTodo() async {
    // popula a lista
    todos = await _dataBaseService.listTodo();
    notifyListeners();
  }

  void update(Todo value) async {
    await _dataBaseService.updateTodo(value);
    fetchTodo();
  }

  void remove(Todo value) async {
    await _dataBaseService.deleteTodo(value);
    fetchTodo();
  }
}
