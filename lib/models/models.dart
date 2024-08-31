// class Employee {
//   Employee(this.name, this.netSalary, this.taxEarning, this.incomeTax,
//       this.pensionTax, this.grossPay);

//   final String name;
//   final double netSalary;
//   final double taxEarning;
//   final double incomeTax;
//   final double pensionTax;
//   final double grossPay;
// }

class Company {
  final int? id;
  final String name;
  final String address;
  final String phoneNumber;
  final String tinNumber;
  final int numberOfEmployees;
  final String companyBank;
  final String bankAccount;

  Company({
    this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.tinNumber,
    required this.numberOfEmployees,
    required this.companyBank,
    required this.bankAccount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'tinNumber': tinNumber,
      'numberOfEmployees': numberOfEmployees,
      'companyBank': companyBank,
      'bankAccount': bankAccount,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
      tinNumber: map['tinNumber'],
      numberOfEmployees: map['numberOfEmployees'],
      companyBank: map['companyBank'],
      bankAccount: map['bankAccount'],
    );
  }
}
