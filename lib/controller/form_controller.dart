import 'package:Demoz/models/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FormController extends GetxController {
  RxBool isPasswordVissible = false.obs;

  TextEditingController? controller;
  var selectedDate = ''.obs;

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
