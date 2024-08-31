import 'package:Demoz/models/company_table_helper.dart';
import 'package:Demoz/models/database_helper.dart';
import 'package:Demoz/models/models.dart';
import 'package:Demoz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class FormController extends GetxController {
  RxBool isPasswordVissible = false.obs;
  RxBool isFormValid = true.obs;

  int? companyID;
  Future<void> defaultFunction() {
    return Future.delayed(Duration.zero);
  }

  void validator() {
    print("Validator called");
    final tinNumber = tinNumberController.text;
    final phoneNumber = phoneNumberController.text;
    final numberOfEmployee = numberOfEmployeeController.text;

    // if (tinNumber.length != 10 || !RegExp(r'^\d{10}$').hasMatch(tinNumber)) {
    //   Get.snackbar('Error', 'TIN number must be exactly 10 digits');
    //   isFormValid.value = false;
    // } else if (int.tryParse(numberOfEmployee) == null) {
    //   Get.snackbar('Error', 'Employee Must be integer');
    //   isFormValid.value = false;
    // }

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

  ///
  TextEditingController startingDateOfSalaryController =
      TextEditingController();

  Future<void> showDatePicker(
      BuildContext context, TextEditingController controller) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Date'),
          content: Container(
            // color: Colors.red,
            // width: double.maxFinite,
            width: 400,
            height: 300,
            child: SfDateRangePicker(
              headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                // backgroundColor: Colors.blue,
                backgroundColor: primaryColor,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: white,
              selectionColor: primaryColor,
              // selectionMode: DateRangePickerSelectionMode.range,
              selectionMode: DateRangePickerSelectionMode.single,
              allowViewNavigation: true,
              view: DateRangePickerView.month,
              initialDisplayDate:
                  DateTime.now(), // Show the current month and year

              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is DateTime) {
                  controller.text = (args.value as DateTime)
                      .toLocal()
                      .toString()
                      .split(' ')[0];
                }
              },
              // selectionMode: DateRangePickerSelectionMode.single,
              // selectionMode: DateRangePickerSelectionMode.range,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
      int companyId) async {
    // Access the database helper instance and call insert method
    await DatabaseHelper.instance.insertEmployee(
      Employee(
          employeeName: employeeName,
          netSalary: netSalary,
          taxEarning: taxEarning,
          incomeTax: incomeTax,
          pensionTax: pensionTax,
          grossPay: grossPay,
          companyId: companyID),
    );
  }
}
