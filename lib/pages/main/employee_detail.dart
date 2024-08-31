import 'package:Demoz/controller/company_controller.dart';
import 'package:Demoz/controller/form_controller.dart';
import 'package:Demoz/controller/payment.dart';
import 'package:Demoz/models/database_helper.dart';
import 'package:Demoz/models/models.dart';
import 'package:Demoz/utils/constants.dart';
import 'package:Demoz/widgets/custom_buttons.dart';
import 'package:Demoz/widgets/custom_texts.dart';
import 'package:Demoz/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingText('Management'),
                  Container(
                    width: 140,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(22, 193, 152, 1),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(color: Colors.white, size: 15, Icons.add),
                        ),
                        HorizontalSpace(4),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/add_employee');
                          },
                          child: NormalAppText(
                            text: "Add Employee",
                            fontSize: 12,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.upload),
                  Text(
                    "Upload CSV",
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // DataGrid Implementation
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  height: 700,
                  // Adjust as necessary
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // Optional: add border
                    // border: Border.all(color: Colors.grey),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10), // Apply border radius clipping
                    child: SfDataGrid(
                      source: EmployeeDataSource(),
                      columnWidthMode: ColumnWidthMode.fill,
                      columns: [
                        GridColumn(
                          width: 100,
                          columnName: 'employeeName',
                          label: Container(
                            color: Color.fromRGBO(229, 248, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Employee Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          width: 88,
                          columnName: 'netSalary',
                          label: Container(
                            color: Color.fromRGBO(253, 255, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Net Salary',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          width: 77,
                          columnName: 'taxEarning',
                          label: Container(
                            color: Color.fromRGBO(229, 248, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Tax Earnings',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          width: 77,
                          columnName: 'incomeTax',
                          label: Container(
                            color: Color.fromRGBO(253, 255, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Income Tax',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          width: 85,
                          columnName: 'pensionTax',
                          label: Container(
                            color: Color.fromRGBO(229, 248, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Pension Tax',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          width: 77,
                          columnName: 'grossPay',
                          label: Container(
                            color: Color.fromRGBO(253, 255, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Gross Pay',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          width: 77,
                          columnName: 'action',
                          label: Container(
                            color: Color.fromRGBO(229, 248, 255, 1),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Action',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              VerticalSpace(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    final paymentControlles = Get.find<paymentController>();
                    // Get.toNamed('/pay_in_bulk');
                    paymentControlles.addMoneyToWallet(context, '50');
                  },
                  child: Container(
                      width: 180,
                      height: 50,
                      child: PrimaryButton(
                          color: primaryColor,
                          text: "Pay in Bulk",
                          textColor: white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Data source for the SfDataG
//
//
//
//
//
// rid

class EmployeeDataSource extends DataGridSource {
  final List<Employee> employees = [];

  EmployeeDataSource() {
    _loadData();
  }

  Future<void> _loadData() async {
    final forController = Get.find<FormController>();

    final companyid = forController.companyID ?? 1;
    final dbHelper = DatabaseHelper.instance;

    final fetchedEmployees = await dbHelper.fetchEmployees(companyid);
    employees.addAll(fetchedEmployees);
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => employees
      .map((e) => DataGridRow(cells: [
            DataGridCell<String>(
                columnName: 'employeeName', value: e.employeeName),
            DataGridCell<double>(columnName: 'netSalary', value: e.netSalary),
            DataGridCell<double>(columnName: 'taxEarning', value: e.taxEarning),
            DataGridCell<double>(columnName: 'incomeTax', value: e.incomeTax),
            DataGridCell<double>(columnName: 'pensionTax', value: e.pensionTax),
            DataGridCell<double>(columnName: 'grossPay', value: e.grossPay),
            DataGridCell<Widget>(
                columnName: 'action',
                value: Container(
                  width: 51,
                  height: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(48, 190, 183, 1),
                  ),
                  child: Center(
                    child: const Text(
                      'Pay',
                      style: TextStyle(fontSize: 11, color: white),
                    ),
                  ),
                )),
          ]))
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    bool isFirstRow = rows.indexOf(row) == 0;
    return DataGridRowAdapter(
      cells: row.getCells().asMap().entries.map<Widget>((entry) {
        int columnIndex = entry.key;
        DataGridCell cell = entry.value;

        // Color columnColor = (columnIndex % 2 == 0) ? Colors.red : Colors.blue;
        Color columnColor = (columnIndex % 2 == 0)
            ? Color.fromRGBO(229, 248, 255, 1)
            : Color.fromRGBO(253, 255, 255, 1);

        // Color rowColor = isFirstRow ? Colors.green : columnColor;

        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          color: columnColor,
          child: cell.columnName == 'action'
              ? cell.value
              : Text(
                  cell.value.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
        );
      }).toList(),
    );
  }
}
