import 'package:Demoz/models/company_table_helper.dart';
import 'package:Demoz/models/models.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {
  var firstCompany = Rx<Company?>(null);

  @override
  void onInit() async {
    super.onInit();
    await fetchFirstCompany();
  }

  Future<void> fetchFirstCompany() async {
    print("Company Controller called");

    final dbHelper = CompanyTableHelper.instance;
    final List<Company> companies = await dbHelper.queryAllRows();
    if (companies.isNotEmpty) {
      firstCompany.value =
          companies.last; // Set the first company to the observable
      print("Company Controller called");
      print(firstCompany);
    } else {
      firstCompany.value = null; // No companies in the database
    }
  }
}
