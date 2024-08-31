import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Define the Employee table name
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
    grossPay
  ];

  static final String id = '_id';
  static final String employeeName = 'employeeName';
  static final String netSalary = 'netSalary';
  static final String taxEarning = 'taxEarning';
  static final String incomeTax = 'incomeTax';
  static final String pensionTax = 'pensionTax';
  static final String grossPay = 'grossPay';
}

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  // Private constructor for singleton
  DatabaseHelper._init();

  // Future<Database> get database async {
  //   _database ??= await _initDB('employee.db');
  //   return _database!;
  // }
  Future<Database> get database async {
    if (_database != null) return _database!;
    print(
        "####################################################### Initializing database ###############################3"); // Add this line
    // _database = await _initDB('employee.db');
    _database = await _initDB('employee1.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableEmployee (
        ${EmployeeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${EmployeeFields.employeeName} TEXT NOT NULL,
        ${EmployeeFields.netSalary} REAL NOT NULL,
        ${EmployeeFields.taxEarning} REAL NOT NULL,
        ${EmployeeFields.incomeTax} REAL NOT NULL,
        ${EmployeeFields.pensionTax} REAL NOT NULL,
        ${EmployeeFields.grossPay} REAL NOT NULL
      )
    ''');
  }

  Future<void> insertEmployee(Employee employee) async {
    final db = await instance.database;
    await db.insert(tableEmployee, employee.toMap());
  }

  Future<List<Employee>> fetchEmployees() async {
    final db = await instance.database;
    final maps = await db.query(tableEmployee);
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

  Employee({
    this.id,
    required this.employeeName,
    required this.netSalary,
    required this.taxEarning,
    required this.incomeTax,
    required this.pensionTax,
    required this.grossPay,
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
    );
  }
}
