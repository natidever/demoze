import 'package:Demoz/controller/company_controller.dart';
import 'package:Demoz/controller/dashboard_controller.dart';
import 'package:Demoz/controller/form_controller.dart';
import 'package:Demoz/controller/payment.dart';
import 'package:Demoz/widgets/custom_form.dart';
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
    Get.put(paymentController());
    Get.put(DashboardController());

    Get.lazyPut(() => CompanyController());
    // Get.put(HomeController());
    // Get.put(DiscoverController());
    // Get.put(CusomSearchController());
  }
}
