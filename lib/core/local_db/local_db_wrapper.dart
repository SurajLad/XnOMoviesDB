abstract class Database {
  Future<void> putData();

  Future<void> getData();
}

class DatabaseHelper extends Database {
  // final _db;
  // DatabaseHelper({required Box db}) : _db = db;

  @override
  Future<void> getData() {
    throw UnimplementedError();
  }

  @override
  Future<void> putData() {
    throw UnimplementedError();
  }
}
