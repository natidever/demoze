import 'package:demoze/pages/authentications/company_registration.dart';
import 'package:demoze/pages/authentications/signup.dart';
import 'package:demoze/pages/main/add_employee.dart';
import 'package:demoze/pages/main/base_screen.dart';
import 'package:demoze/pages/main/company_profile.dart';
import 'package:demoze/pages/main/employee_detail.dart';
import 'package:demoze/pages/main/homepage.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define route names
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const signup = '/signup';
  static const base_screen = '/base_screen';
  static const company_profile = '/profile';
  static const registration = '/registration';
  static const employee_detail = '/employee_detail';
  static const add_employee = '/add_employee';

  // Define the routes map u
  static List<GetPage> routes = [
    GetPage(
      name: signup,
      page: () => Signup(),
    ),
    GetPage(name: registration, page: () => CompanyRegistration()),
    GetPage(name: base_screen, page: () => BaseScreen()),
    GetPage(name: employee_detail, page: () => EmployeeDetail()),
    GetPage(name: company_profile, page: () => CompanyProfile()),
    GetPage(name: home, page: () => Homepage()),
    GetPage(name: base_screen, page: () => BaseScreen()),
    GetPage(name: add_employee, page: () => AddEmployee())
  ];
}
