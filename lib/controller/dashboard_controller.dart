import 'package:Demoz/models/company_table_helper.dart';
import 'package:Demoz/models/database_helper.dart';
import 'package:get/get.dart';
// import 'your_database_helper_file.dart'; // Replace with your actual file path

class DashboardController extends GetxController {
  var totalEmployees = 0.obs; // Observable integer to track the total employees
  var totalIncomeTax =
      0.0.obs; // Observable double to track the total income tax
  var totalPensionPaid =
      0.0.obs; // Observable double to track the total income tax

  void fetchTotalEmployees(int companyId) async {
    try {
      final employees = await DatabaseHelper.instance.fetchEmployees(companyId);
      totalEmployees.value = employees.length;

      print("Total employee in the cmpany is ${totalEmployees} ");
    } catch (e) {
      print("Error fetching total employees: $e");
    }
  }

  void fetchTotalIncomeTax(int companyId) async {
    try {
      final employees = await DatabaseHelper.instance.fetchEmployees(companyId);
      double totalTax =
          employees.fold(0.0, (sum, employee) => sum + employee.incomeTax);
      totalIncomeTax.value = totalTax;
      print("total income tax is ${totalIncomeTax}");
    } catch (e) {
      print("Error fetching total income tax: $e");
    }
  }

  void fetchTotalPensionPaid(int? companyId) async {
    if (companyId == null) return; // Handle the case where companyId is null
    try {
      final employees = await DatabaseHelper.instance.fetchEmployees(companyId);
      double totalPension =
          employees.fold(0.0, (sum, employee) => sum + employee.pensionTax);
      totalPensionPaid.value = totalPension;
      print("total pension paid is ${totalPensionPaid}");
    } catch (e) {
      print("Error fetching total pension paid: $e");
    }
  }

  void taxSummary() {}
}
