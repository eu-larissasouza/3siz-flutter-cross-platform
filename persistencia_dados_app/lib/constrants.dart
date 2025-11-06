const String baseUrl = 'https://gdapp.com.br/api';
const dataBaseName = 'todo_app_v2';
const String tableName = 'todos';

const String scriptCreateTable = '''
CREATE TABLE IF NOT EXISTS todos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  done INTEGER NOT NULL
)
''';
