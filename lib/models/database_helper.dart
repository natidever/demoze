// import 'package:get/get.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// // Define the Employee table name
// final String tableEmployee = 'employee';

// // Define the Employee table columns
// class EmployeeFields {
//   static final List<String> values = [
//     id,
//     employeeName,
//     netSalary,
//     taxEarning,
//     incomeTax,
//     pensionTax,
//     grossPay,
//     companyId
//   ];

//   static final String id = '_id';
//   static final String employeeName = 'employeeName';
//   static final String netSalary = 'netSalary';
//   static final String taxEarning = 'taxEarning';
//   static final String incomeTax = 'incomeTax';
//   static final String pensionTax = 'pensionTax';
//   static final String grossPay = 'grossPay';
//   static final String companyId = 'companyId';
// }

// class DatabaseHelper {
//   // Singleton instance
//   static final DatabaseHelper instance = DatabaseHelper._init();

//   static Database? _database;

//   // Private constructor for singleton
//   DatabaseHelper._init();

//   // Future<Database> get database async {
//   //   _database ??= await _initDB('employee.db');
//   //   return _database!;
//   // }
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     print(
//         "####################################################### Initializing database ###############################3"); // Add this line
//     // _database = await _initDB('employee.db');

//     _database = await _initDB('employee3.db');
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     // await deleteDatabaseFile();
//     _database.printError();
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future<void> _createDB(Database db, int version) async {
//     print(
//         "####################################################### CREATING TABLE EMPLOYEE ###############################");
//     await db.execute('''
//       CREATE TABLE $tableEmployee (
//         ${EmployeeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
//         ${EmployeeFields.employeeName} TEXT NOT NULL,
//         ${EmployeeFields.netSalary} REAL NOT NULL,
//         ${EmployeeFields.taxEarning} REAL NOT NULL,
//         ${EmployeeFields.incomeTax} REAL NOT NULL,
//         ${EmployeeFields.pensionTax} REAL NOT NULL,

//         ${EmployeeFields.grossPay} REAL NOT NULL,
//         ${EmployeeFields.companyId} INTEGER,
//        FOREIGN KEY (${EmployeeFields.companyId}) REFERENCES company(id)

//       )
//     ''');
//   }

//   Future<void> deleteDatabaseFile() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'employee3.db');
//     await deleteDatabase(path);
//   }
//   //

//   // Future<void> _createDB(Database db, int version) async {
//   //   print(
//   //       "####################################################### CREATING TABLE EMPLOYEE ###############################");

//   //   await db.execute('''
//   //   CREATE TABLE $tableEmployee (
//   //     ${EmployeeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
//   //     ${EmployeeFields.employeeName} TEXT NOT NULL,
//   //     ${EmployeeFields.netSalary} REAL NOT NULL,
//   //     ${EmployeeFields.taxEarning} REAL NOT NULL,
//   //     ${EmployeeFields.incomeTax} REAL NOT NULL,
//   //     ${EmployeeFields.pensionTax} REAL NOT NULL,
//   //     ${EmployeeFields.grossPay} REAL NOT NULL,
//   //     ${EmployeeFields.companyId} INTEGER,
//   //     FOREIGN KEY (${EmployeeFields.companyId}) REFERENCES company(id)
//   //   )
//   // ''');

//   //   // Print a message to indicate the table creation is completed
//   //   print("Table $tableEmployee created successfully.");

//   //   // Verify if the table exists
//   //   final result = await db.rawQuery(
//   //       "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableEmployee'");

//   //   if (result.isNotEmpty) {
//   //     print("Table $tableEmployee exists.");
//   //   } else {
//   //     print("Table $tableEmployee does not exist.");
//   //   }
//   // }

//   Future<void> insertEmployee(Employee employee) async {
//     final db = await instance.database;
//     await db.insert(tableEmployee, employee.toMap());
//   }

//   Future<List<Employee>> fetchEmployees() async {
//     final db = await instance.database;
//     final maps = await db.query(tableEmployee);
//     return maps.map((map) => Employee.fromMap(map)).toList();
//   }
// }

// class Employee {
//   final int? id;
//   final String employeeName;
//   final double netSalary;
//   final double taxEarning;
//   final double incomeTax;
//   final double pensionTax;
//   final double grossPay;
//   final int? companyId;

//   Employee({
//     this.id,
//     required this.employeeName,
//     required this.netSalary,
//     required this.taxEarning,
//     required this.incomeTax,
//     required this.pensionTax,
//     required this.grossPay,
//     this.companyId,
//   });

//   Employee copy({
//     int? id,
//     String? employeeName,
//     double? netSalary,
//     double? taxEarning,
//     double? incomeTax,
//     double? pensionTax,
//     double? grossPay,
//   }) =>
//       Employee(
//         id: id ?? this.id,
//         employeeName: employeeName ?? this.employeeName,
//         netSalary: netSalary ?? this.netSalary,
//         taxEarning: taxEarning ?? this.taxEarning,
//         incomeTax: incomeTax ?? this.incomeTax,
//         pensionTax: pensionTax ?? this.pensionTax,
//         grossPay: grossPay ?? this.grossPay,
//       );

//   Map<String, Object?> toMap() {
//     return {
//       EmployeeFields.id: id,
//       EmployeeFields.employeeName: employeeName,
//       EmployeeFields.netSalary: netSalary,
//       EmployeeFields.taxEarning: taxEarning,
//       EmployeeFields.incomeTax: incomeTax,
//       EmployeeFields.pensionTax: pensionTax,
//       EmployeeFields.grossPay: grossPay,
//       'companyId': companyId,
//     };
//   }

//   static Employee fromMap(Map<String, Object?> map) {
//     return Employee(
//       id: map[EmployeeFields.id] as int?,
//       employeeName: map[EmployeeFields.employeeName] as String,
//       netSalary: map[EmployeeFields.netSalary] as double,
//       taxEarning: map[EmployeeFields.taxEarning] as double,
//       incomeTax: map[EmployeeFields.incomeTax] as double,
//       pensionTax: map[EmployeeFields.pensionTax] as double,
//       grossPay: map[EmployeeFields.grossPay] as double,
//       companyId: map['companyId'] as int?,
//     );
//   }
// }
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Define the Employee table namenew
final String tableEmployee = 'employee';

// Define the Employee table columns
class EmployeeFields {
  static final List<String> values = [
    id,
    employeeName,
    netSalary,
    taxEarning,
    incomeTax,
    pensionTax,
    grossPay,
    companyId
  ];

  static final String id = '_id';
  static final String employeeName = 'employeeName';
  static final String netSalary = 'netSalary';
  static final String taxEarning = 'taxEarning';
  static final String incomeTax = 'incomeTax';
  static final String pensionTax = 'pensionTax';
  static final String grossPay = 'grossPay';
  static final String companyId = 'companyId';
}

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  // Private constructor for singleton
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    print(
        "####################################################### Initializing database ###############################");
    _database = await _initDB('employee3.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    print(
        "####################################################### CREATING TABLE EMPLOYEE ###############################");
    await db.execute('''
      CREATE TABLE $tableEmployee (
        ${EmployeeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${EmployeeFields.employeeName} TEXT NOT NULL,
        ${EmployeeFields.netSalary} REAL NOT NULL,
        ${EmployeeFields.taxEarning} REAL NOT NULL,
        ${EmployeeFields.incomeTax} REAL NOT NULL,
        ${EmployeeFields.pensionTax} REAL NOT NULL,
        ${EmployeeFields.grossPay} REAL NOT NULL,
        ${EmployeeFields.companyId} INTEGER,
        FOREIGN KEY (${EmployeeFields.companyId}) REFERENCES company(id)
      )
    ''');
    print("Table $tableEmployee created successfully.");
  }

  Future<void> insertEmployee(Employee employee) async {
    final db = await instance.database;
    await db.insert(tableEmployee, employee.toMap());
  }

  // Future<List<Employee>> fetchEmployees() async {
  //   final db = await instance.database;
  //   final maps = await db.query(tableEmployee);
  //   return maps.map((map) => Employee.fromMap(map)).toList();
  // }
  Future<List<Employee>> fetchEmployees(int companyId) async {
    final db = await instance.database;

    // Fetch employees where companyId matches the given ID
    final maps = await db.query(
      tableEmployee,
      where: '${EmployeeFields.companyId} = ?',
      whereArgs: [companyId],
    );

    return maps.map((map) => Employee.fromMap(map)).toList();
  }
}

class Employee {
  final int? id;
  final String employeeName;
  final double netSalary;
  final double taxEarning;
  final double incomeTax;
  final double pensionTax;
  final double grossPay;
  final int? companyId;

  Employee({
    this.id,
    required this.employeeName,
    required this.netSalary,
    required this.taxEarning,
    required this.incomeTax,
    required this.pensionTax,
    required this.grossPay,
    this.companyId,
  });

  Employee copy({
    int? id,
    String? employeeName,
    double? netSalary,
    double? taxEarning,
    double? incomeTax,
    double? pensionTax,
    double? grossPay,
  }) =>
      Employee(
        id: id ?? this.id,
        employeeName: employeeName ?? this.employeeName,
        netSalary: netSalary ?? this.netSalary,
        taxEarning: taxEarning ?? this.taxEarning,
        incomeTax: incomeTax ?? this.incomeTax,
        pensionTax: pensionTax ?? this.pensionTax,
        grossPay: grossPay ?? this.grossPay,
        companyId: companyId ?? this.companyId,
      );

  Map<String, Object?> toMap() {
    return {
      EmployeeFields.id: id,
      EmployeeFields.employeeName: employeeName,
      EmployeeFields.netSalary: netSalary,
      EmployeeFields.taxEarning: taxEarning,
      EmployeeFields.incomeTax: incomeTax,
      EmployeeFields.pensionTax: pensionTax,
      EmployeeFields.grossPay: grossPay,
      EmployeeFields.companyId: companyId,
    };
  }

  static Employee fromMap(Map<String, Object?> map) {
    return Employee(
      id: map[EmployeeFields.id] as int?,
      employeeName: map[EmployeeFields.employeeName] as String,
      netSalary: map[EmployeeFields.netSalary] as double,
      taxEarning: map[EmployeeFields.taxEarning] as double,
      incomeTax: map[EmployeeFields.incomeTax] as double,
      pensionTax: map[EmployeeFields.pensionTax] as double,
      grossPay: map[EmployeeFields.grossPay] as double,
      companyId: map[EmployeeFields.companyId] as int?,
    );
  }
}
