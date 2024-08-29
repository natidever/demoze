import 'package:demoze/pages/authentications/login.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define route names
  static const home = '/home';
  static const details = '/details';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const base_screen = '/base_screen';
  static const bookmark = '/bookmark';
  static const discover = '/discover';
  static const profile = '/profile';
  static const single_publisher = '/single_publisher';
  static const search = '/search';

  // Define the routes map u
  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => Login(),
    ),
  ];
}
