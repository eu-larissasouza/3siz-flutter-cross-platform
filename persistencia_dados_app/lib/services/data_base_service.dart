import 'package:path/path.dart';
import 'package:persistencia_dados_app/models/todo.dart';
import 'package:sqflite/sqflite.dart';

// CLASSE DO NOSSO SERVIÇO DE BANCO DE DADOS
// -> Utiliza o sqlite para persistir dados
// -> sqlite permite usar um banco de dados mais leve e em memoria ou em discos

// Camada de gerenciamento de dados

class DataBaseService {
  
  // ABERTURA DO BANCO DE DADOS
  Future<Database> get _db async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            done INTEGER
          )
        ''');
      },
    );
  }

  // INSERINDO TAREFAS NO BANCO
  Future<void> insertTodo(Todo value) async {
    final db = await _db;
    db.insert(
      'todos',
      value.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // LISTANDO TAREFAS
  Future<List<Todo>> listTodo() async {
    final db = await _db;
    // Busca no banco e o retorno está no formato Map
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return maps.map((e) => Todo.fromJson(e)).toList();
  }

  // ATUALIZANDO TAREFAS
  Future<void> updateTodo(Todo value) async {
    final db = await _db;
    db.update('todos', value.toJson(), where: 'id = ?', whereArgs: [value.id]);
  }

  // EXCLUIR TAREFAS
  Future<void> deleteTodo(Todo value) async {
    final db = await _db;
    db.delete('todos', where: 'id = ?', whereArgs: [value.id]);
  }
}
