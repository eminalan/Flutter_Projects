import 'package:bloc_sqfflite_app/data/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// SQLite işlemleri burada yapılır
class ContactLocalDataSource {
  static Database? _database;

  // Veritabanını başlat
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  // Veritabanı oluşturma
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'contacts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  // Tabloyu oluştur
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone TEXT
      )
    ''');
  }

  // Kişi ekleme
  Future<void> insertContact(UserModel contact) async {
    final db = await database;
    await db.insert('contacts', contact.toMap());
  }

  // Kişi güncelleme
  Future<void> updateContact(UserModel contact) async {
    final db = await database;
    await db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  // Kişi silme
  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Kişi listeleme
  Future<List<UserModel>> getContacts() async {
    final db = await database;
    final result = await db.query('contacts');
    return result.map((map) => UserModel.fromMap(map)).toList();
  }
}