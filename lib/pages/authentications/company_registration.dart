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

  void _validateForm() {
    _isFormValid.value = _companyNameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _tinNumberController.text.isNotEmpty &&
        _numberOfEmployeeController.text.isNotEmpty &&
        _companyBankController.text.isNotEmpty &&
        _bacnkAccountController.text.isNotEmpty;
    print("value:${_isFormValid} :");
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
                    // controller: _emailController,
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
                    // controller: _emailController,
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
                    // controller: _emailController,
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
                    // controller: _emailController,
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
                    // controller: _emailController,
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
                    // controller: _emailController,
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
                    isPasswordVissible: false,
                    labelText: "Bank account numner",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/base_screen');
                },
                child: PrimaryButton(
                    text: "Sign up",
                    color: _isFormValid.value == true
                        ? primaryColor
                        : inactiveButtonColor,
                    textColor: _isFormValid.value
                        ? white
                        : inactiveTextColorForButton),
              )
            ],
          ),
        ),
      ),
    );
  }
}
