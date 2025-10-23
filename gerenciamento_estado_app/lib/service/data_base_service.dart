import 'package:gerenciamento_estado_app/domain/explorer.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// esse banco fica salvo no provider que é executado
class DataBaseService {
  Future<Database> get _db async {
    return openDatabase(
      join(await getDatabasesPath(), 'explorer_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE explorers(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
          ''');
      },
    );
  }

  Future<void> insertExplorer(Explorer explorer) async {
    final db = await _db;
    db.insert(
      'explorers',
      explorer.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
