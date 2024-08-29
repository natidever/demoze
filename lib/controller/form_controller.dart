import 'package:get/get.dart';

class FormController extends GetxController {
  RxBool isPasswordVissible = false.obs;

  void TogglePasswordVissiblity() {
    print('toggle called');
    isPasswordVissible.toggle();
    print(isPasswordVissible);
  }
}
