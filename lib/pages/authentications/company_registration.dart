import 'dart:ffi';

import 'package:Demoz/controller/form_controller.dart';
import 'package:Demoz/models/company_table_helper.dart';
import 'package:Demoz/models/models.dart';
import 'package:Demoz/utils/constants.dart';
import 'package:Demoz/widgets/custom_buttons.dart';
import 'package:Demoz/widgets/custom_form.dart';
import 'package:Demoz/widgets/custom_texts.dart';
import 'package:Demoz/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyRegistration extends StatefulWidget {
  const CompanyRegistration({super.key});

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  RxBool _isFormValid = false.obs;
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _numberOfEmployeeController =
      TextEditingController();
  final TextEditingController _companyBankController = TextEditingController();
  final TextEditingController _bacnkAccountController = TextEditingController();

  void validateForm() {
    _isFormValid.value = formcontroller.companyNameController.text.isNotEmpty &&
        formcontroller.addressController.text.isNotEmpty &&
        formcontroller.phoneNumberController.text.isNotEmpty &&
        formcontroller.tinNumberController.text.isNotEmpty &&
        formcontroller.numberOfEmployeeController.text.isNotEmpty &&
        formcontroller.companyBankController.text.isNotEmpty &&
        formcontroller.bacnkAccountController.text.isNotEmpty;

    print("value:${_isFormValid} :");
  }

  final formcontroller = Get.find<FormController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formcontroller.companyNameController.addListener(validateForm);
    formcontroller.addressController.addListener(validateForm);
    formcontroller.phoneNumberController.addListener(validateForm);
    formcontroller.tinNumberController.addListener(validateForm);
    formcontroller.numberOfEmployeeController.addListener(validateForm);
    formcontroller.companyBankController.addListener(validateForm);
    formcontroller.bacnkAccountController.addListener(validateForm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText("Register your company"),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeadingText("to"),
                  HorizontalSpace(10),
                  Text(
                    'Demoz Payroll',
                    style: GoogleFonts.lexend(
                        color: primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: SubText("Register you company to continue")),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: formcontroller.companyNameController,
                    isPasswordVissible: false,
                    labelText: "Company name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: formcontroller.addressController,
                    isPasswordVissible: false,
                    labelText: "Address of company",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: formcontroller.phoneNumberController,
                    isPasswordVissible: false,
                    labelText: "Phone Number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: formcontroller.tinNumberController,
                    isPasswordVissible: false,
                    labelText: "Tin Number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: formcontroller.numberOfEmployeeController,
                    isPasswordVissible: false,
                    labelText: "Number of employees",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: formcontroller.companyBankController,
                    isPasswordVissible: false,
                    labelText: "Company bank",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    // controller: _emailController,
                    controller: formcontroller.bacnkAccountController,
                    isPasswordVissible: false,
                    labelText: "Bank account numner",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  print("TAPPPED");
                  print(_isFormValid);
                  // Check if all form fields are filled
                  if (formcontroller.companyNameController.text.isNotEmpty &&
                      formcontroller.addressController.text.isNotEmpty &&
                      formcontroller.phoneNumberController.text.isNotEmpty &&
                      formcontroller.tinNumberController.text.isNotEmpty &&
                      formcontroller
                          .numberOfEmployeeController.text.isNotEmpty &&
                      formcontroller.companyBankController.text.isNotEmpty &&
                      formcontroller.bacnkAccountController.text.isNotEmpty) {
                    formcontroller.validator();

                    final formController = Get.find<FormController>();

                    // Call the method to insert company data (it returns void)sdad
                    await formController.insertCompanyData();

                    // Fetch the data to verify it has been saved
                    final dbHelper = CompanyTableHelper.instance;
                    final List<Company> companies =
                        await dbHelper.queryAllRows();

                    Get.snackbar(
                        "Success", "Your Company Is Registerd Successfully");

                    Get.toNamed('/base_screen');

                    // Print the saved company data to the console
                    for (var company in companies) {
                      print('Company ID: ${company.id}');
                      print('Name: ${company.name}');
                      print('Address: ${company.address}');
                      print('Phone Number: ${company.phoneNumber}');
                      print('TIN Number: ${company.tinNumber}');
                      print(
                          'Number of Employees: ${company.numberOfEmployees}');
                      print('Company Bank: ${company.companyBank}');
                      print('Bank Account: ${company.bankAccount}');
                      print('-----------------------------');
                    }

// 12345678

                    // Get.snackbar("Success", "Company Register Successfully");

                    // Find the FormController instance using Get.find

                    // Show success message

                    // Clear the form fields
                    // _companyNameController.clear();
                    // _addressController.clear();
                    // _phoneNumberController.clear();
                    // _tinNumberController.clear();
                    // _numberOfEmployeeController.clear();
                    // _companyBankController.clear();
                    // _bacnkAccountController.clear();

                    // Navigate to the next screen
                    // Get.toNamed('/base_screen');
                  } else {
                    // Show an error message if the form is not valid
                    Get.snackbar('Error', 'Please fill all required fields');
                  }
                },
                child: Obx(() {
                  return PrimaryButton(
                    text: "Sign up",
                    color: _isFormValid.value == true
                        ? primaryColor
                        : inactiveButtonColor,
                    textColor:
                        _isFormValid.value ? white : inactiveTextColorForButton,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
