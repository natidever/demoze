import 'package:Demoz/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CompanyTableHelper {
  static final _databaseName = "employee3.db";
  static final _databaseVersion = 1;

  static final table = 'company';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAddress = 'address';
  static final columnPhoneNumber = 'phoneNumber';
  static final columnTinNumber = 'tinNumber';
  static final columnNumberOfEmployees = 'numberOfEmployees';
  static final columnCompanyBank = 'companyBank';
  static final columnBankAccount = 'bankAccount';

  // Singleton class
  CompanyTableHelper._privateConstructor();
  static final CompanyTableHelper instance =
      CompanyTableHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // await deleteDatabaseFile();

    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnAddress TEXT NOT NULL,
        $columnPhoneNumber TEXT NOT NULL,
        $columnTinNumber TEXT NOT NULL,
        $columnNumberOfEmployees INTEGER NOT NULL,
        $columnCompanyBank TEXT NOT NULL,
        $columnBankAccount TEXT NOT NULL
      )
    ''');

    await db.execute('''
    CREATE TABLE employee (
      _id INTEGER PRIMARY KEY AUTOINCREMENT,
      employeeName TEXT NOT NULL,
      netSalary REAL NOT NULL,
      taxEarning REAL NOT NULL,
      incomeTax REAL NOT NULL,
      pensionTax REAL NOT NULL,
      grossPay REAL NOT NULL,
      companyId INTEGER,
      FOREIGN KEY (companyId) REFERENCES company(id)
    )
  ''');
  }

  Future<int> insert(Company company) async {
    Database db = await instance.database;
    return await db.insert(table, company.toMap());
  }

  Future<List<Company>> queryAllRows() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Company.fromMap(maps[i]);
    });
  }
}

// Future<void> deleteDatabaseFile() async {
//   final dbPath = await getDatabasesPath();
//   final path = join(dbPath, 'employee3.db');
//   await deleteDatabase(path);
//   print("Database file deleted.");
// }
