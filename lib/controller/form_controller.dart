import 'package:Demoz/models/company_table_helper.dart';
import 'package:Demoz/models/database_helper.dart';
import 'package:Demoz/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FormController extends GetxController {
  RxBool isPasswordVissible = false.obs;
  RxBool isFormValid = true.obs;

  void validator() {
    print("Validator called");
    final tinNumber = tinNumberController.text;
    final phoneNumber = phoneNumberController.text;
    final numberOfEmployee = numberOfEmployeeController.text;

    if (tinNumber.length != 10 || !RegExp(r'^\d{10}$').hasMatch(tinNumber)) {
      Get.snackbar('Error', 'TIN number must be exactly 10 digits');
      isFormValid.value = false;
    } else if (int.tryParse(numberOfEmployee) == null) {
      Get.snackbar('Error', 'Employee Must be integer');
      isFormValid.value = false;
    }

    print("valideform: ${isFormValid}");
  }

  TextEditingController? controller;
  var selectedDate = ''.obs;

  // Import the updated CompanyTableHelper class

// Define your controllers
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tinNumberController = TextEditingController();
  final TextEditingController numberOfEmployeeController =
      TextEditingController();
  final TextEditingController companyBankController = TextEditingController();
  final TextEditingController bacnkAccountController = TextEditingController();

  insertCompanyData() async {
    print("Insert data is called");
    final companyName = companyNameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final tinNumber = tinNumberController.text;
    final numberOfEmployees =
        int.tryParse(numberOfEmployeeController.text) ?? 0;
    final companyBank = companyBankController.text;
    final bankAccount = bacnkAccountController.text;

    print('fROMCONTROLLLER_Company Name: $companyName');
    print('Address: $address');
    print('Phone Number: $phoneNumber');
    print('TIN Number: $tinNumber');
    print('Number of Employees: $numberOfEmployees');
    print('Company Bank: $companyBank');
    print('Bank Account: $bankAccount');

    final company = Company(
      name: companyName,
      address: address,
      phoneNumber: phoneNumber,
      tinNumber: tinNumber,
      numberOfEmployees: numberOfEmployees,
      companyBank: companyBank,
      bankAccount: bankAccount,
    );

    final dbHelper = CompanyTableHelper.instance;
    await dbHelper.insert(company);
  }

  // showDatePicker(BuildContext context) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           child: Container(
  //             height: 400,
  //             width: 300,
  //             child: SfDateRangePicker(
  //               onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
  //                 selectedDate.value = args.value.toString().substring(0, 10);
  //                 Navigator.of(context).pop(); // Close the dialog
  //               },
  //               selectionMode: DateRangePickerSelectionMode.single,
  //               initialSelectedDate: DateTime.now(),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   });
  // }

  void TogglePasswordVissiblity() {
    print('toggle called');
    isPasswordVissible.toggle();
    print(isPasswordVissible);
  }

  // Add this method to your DatabaseHelper class
  // Method to insert employee data from form
  Future<void> insertEmployeeFromForm(
    String employeeName,
    double netSalary,
    double taxEarning,
    double incomeTax,
    double pensionTax,
    double grossPay,
  ) async {
    // Access the database helper instance and call insert method
    await DatabaseHelper.instance.insertEmployee(
      Employee(
        employeeName: employeeName,
        netSalary: netSalary,
        taxEarning: taxEarning,
        incomeTax: incomeTax,
        pensionTax: pensionTax,
        grossPay: grossPay,
      ),
    );
  }
}
