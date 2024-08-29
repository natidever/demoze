import 'package:demoze/controller/form_controller.dart';
import 'package:demoze/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:news_app/controllers/discover_controller.dart';
// import 'package:news_app/controllers/home_controller.dart';
// import 'package:news_app/controllers/login_controller.dart';
// import 'package:news_app/controllers/search_controller.dart';

class MainBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(FormController());
    // Get.put(HomeController());
    // Get.put(DiscoverController());
    // Get.put(CusomSearchController());
  }
}
