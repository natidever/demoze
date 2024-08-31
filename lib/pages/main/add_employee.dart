import 'package:Demoz/controller/form_controller.dart';
import 'package:Demoz/utils/constants.dart';
import 'package:Demoz/widgets/custom_buttons.dart';
import 'package:Demoz/widgets/custom_form.dart';
import 'package:Demoz/widgets/custom_texts.dart';
import 'package:Demoz/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmployee extends StatefulWidget {
  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  // const AddEmployee({super.key});
  RxBool isPerMonth = false.obs;

  RxBool isContrat = false.obs;
  RxBool _isFormValid = false.obs;

  final TextEditingController _employeeNameController = TextEditingController();

  final TextEditingController _emailAddressController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _tinNumberController = TextEditingController();

  final TextEditingController _grossSalaryController = TextEditingController();

  final TextEditingController _taxableEarningsController =
      TextEditingController();

  final TextEditingController _startingDateOfSalaryController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _employeeNameController.addListener(_validateForm);
    _emailAddressController.addListener(_validateForm);
    _phoneNumberController.addListener(_validateForm);
    _tinNumberController.addListener(_validateForm);
    _grossSalaryController.addListener(_validateForm);
    _taxableEarningsController.addListener(_validateForm);
    _startingDateOfSalaryController.addListener(_validateForm);
  }

  void _validateForm() {
    _isFormValid.value = _employeeNameController.text.isNotEmpty &&
        _emailAddressController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _tinNumberController.text.isNotEmpty &&
        _grossSalaryController.text.isNotEmpty &&
        _taxableEarningsController.text.isNotEmpty &&
        formController.startingDateOfSalaryController.text.isNotEmpty;

    print("value_addemploye: ${_isFormValid.value}");
  }

  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        // backgroundColor: white,
        elevation: 0,
        // backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                "Add employee",
                style: GoogleFonts.lexend(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )

            // Icon(Icons.settings, size: 25),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 3, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HeadingText('Add'),
                  HorizontalSpace(5),
                  Text(
                    'New Employee',
                    style: GoogleFonts.lexend(
                        color: primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 28.0, 20),
                child: SubText(
                    'Here you add your new employee and start calculating his tax and salary'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _employeeNameController,
                    isPasswordVissible: false,
                    labelText: "Employee name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _emailAddressController,
                    isPasswordVissible: false,
                    labelText: "Email address",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _phoneNumberController,
                    isPasswordVissible: false,
                    labelText: "Phone number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _tinNumberController,
                    isPasswordVissible: false,
                    labelText: "Tin number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _grossSalaryController,
                    isPasswordVissible: false,
                    labelText: "Gross salary",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _taxableEarningsController,
                    isPasswordVissible: false,
                    labelText: "Taxable  earnings",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    // ontap: formController.showDatePicker(context),

                    // controller: _startingDateOfSalaryController,
                    controller: formController.startingDateOfSalaryController,
                    ontap: () => formController.showDatePicker(
                      context,
                      formController.startingDateOfSalaryController,
                    ),

                    isPasswordVissible: false,
                    labelText: "Starting date of salary",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 35),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (isContrat.isTrue) {
                          isContrat.toggle();
                        }
                        isPerMonth.toggle();
                      },
                      child: SizedBox(
                        width: 111,
                        height: 35.27,
                        child: Obx(() {
                          return PrimaryButton(
                            text: "Per month",
                            // color: primaryColor,
                            color: isPerMonth.isFalse
                                ? Color.fromRGBO(172, 206, 255, 1)
                                : primaryColor,
                            textColor: white,
                          );
                        }),
                      ),
                    ),
                    HorizontalSpace(10),
                    GestureDetector(
                      onTap: () {
                        if (isPerMonth.isTrue) {
                          isPerMonth.toggle();
                        }

                        isContrat.toggle();
                      },
                      child: SizedBox(
                        width: 111,
                        height: 35.27,
                        child: Obx(() {
                          return PrimaryButton(
                            text: "Contrat",
                            color: isContrat.isFalse
                                ? Color.fromRGBO(172, 206, 255, 1)
                                : primaryColor,
                            textColor: white,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () async {
                    final formControllerS = Get.find<FormController>();
                    final isFormValid =
                        _employeeNameController.text.isNotEmpty &&
                            _emailAddressController.text.isNotEmpty &&
                            _phoneNumberController.text.isNotEmpty &&
                            _tinNumberController.text.isNotEmpty &&
                            _grossSalaryController.text.isNotEmpty &&
                            _taxableEarningsController.text.isNotEmpty &&
                            formControllerS
                                .startingDateOfSalaryController.text.isNotEmpty;

                    if (!isFormValid) {
                      // Show an error message if the form is not valid
                      Get.snackbar('Error', 'Please fill all required fields');
                      return;
                    }

                    // Retrieve and parse the form data
                    final employeeName = _employeeNameController.text;
                    final emailAddress = _emailAddressController.text;
                    final phoneNumber = _phoneNumberController.text;
                    final tinNumber = _tinNumberController.text;
                    final grossSalary =
                        double.tryParse(_grossSalaryController.text) ?? 0.0;
                    final taxableEarnings =
                        double.tryParse(_taxableEarningsController.text) ?? 0.0;

                    // Calculate the values for tax and other fields based on Ethiopian tax laws
                    double incomeTax;
                    double pensionTax;

// Calculate income tax based on the brackets
                    // if (taxableEarnings <= 585) {
                    //   incomeTax = 0.0;
                    // } else if (taxableEarnings <= 1650) {
                    //   incomeTax = (taxableEarnings - 585) * 0.10;
                    // } else if (taxableEarnings <= 3145) {
                    //   incomeTax =
                    //       (taxableEarnings - 1650) * 0.15 + (1650 - 585) * 0.1;
                    // } else if (taxableEarnings <= 5195) {
                    //   incomeTax = (taxableEarnings - 3145) * 0.20 +
                    //       (3145 - 1650) * 0.15 +
                    //       (1650 - 585) * 0.1;
                    // } else if (taxableEarnings <= 7758) {
                    //   incomeTax = (taxableEarnings - 5195) * 0.25 +
                    //       (5195 - 3145) * 0.20 +
                    //       (3145 - 1650) * 0.15 +
                    //       (1650 - 585) * 0.1;
                    // } else if (taxableEarnings <= 10833) {
                    //   incomeTax = (taxableEarnings - 7758) * 0.30 +
                    //       (7758 - 5195) * 0.25 +
                    //       (5195 - 3145) * 0.20 +
                    //       (3145 - 1650) * 0.15 +
                    //       (1650 - 585) * 0.1;
                    // } else {
                    //   incomeTax = (taxableEarnings - 10833) * 0.35 +
                    //       (10833 - 7758) * 0.30 +
                    //       (7758 - 5195) * 0.25 +
                    //       (5195 - 3145) * 0.20 +
                    //       (3145 - 1650) * 0.15 +
                    //       (1650 - 585) * 0.1;
                    // }
                    if (taxableEarnings <= 600) {
                      incomeTax = 0.0;
                    } else if (taxableEarnings <= 1650) {
                      incomeTax = (taxableEarnings - 600) * 0.10;
                    } else if (taxableEarnings <= 3200) {
                      incomeTax =
                          (taxableEarnings - 1650) * 0.15 + (1650 - 600) * 0.10;
                    } else if (taxableEarnings <= 5250) {
                      incomeTax = (taxableEarnings - 3200) * 0.20 +
                          (3200 - 1650) * 0.15 +
                          (1650 - 600) * 0.10;
                    } else if (taxableEarnings <= 7800) {
                      incomeTax = (taxableEarnings - 5250) * 0.25 +
                          (5250 - 3200) * 0.20 +
                          (3200 - 1650) * 0.15 +
                          (1650 - 600) * 0.10;
                    } else if (taxableEarnings <= 10900) {
                      incomeTax = (taxableEarnings - 7800) * 0.30 +
                          (7800 - 5250) * 0.25 +
                          (5250 - 3200) * 0.20 +
                          (3200 - 1650) * 0.15 +
                          (1650 - 600) * 0.10;
                    } else {
                      incomeTax = (taxableEarnings - 10900) * 0.35 +
                          (10900 - 7800) * 0.30 +
                          (7800 - 5250) * 0.25 +
                          (5250 - 3200) * 0.20 +
                          (3200 - 1650) * 0.15 +
                          (1650 - 600) * 0.10;
                    }
// Calculate pension tax based on gross salary (7% is typically correct, check with Ethiopian law)
                    pensionTax = grossSalary * 0.07;

// Calculate net salary
                    final netSalary = grossSalary - (incomeTax + pensionTax);

                    // Round the calculated values to two decimal places
                    final netSalaryRounded =
                        double.parse(netSalary.toStringAsFixed(2));
                    final pensionTaxRounded =
                        double.parse(pensionTax.toStringAsFixed(2));
                    final incomeTaxRounded =
                        double.parse(incomeTax.toStringAsFixed(2));

                    // Insert the employee data into the database
                    final formController = Get.find<FormController>();
                    await formController.insertEmployeeFromForm(
                      employeeName,
                      netSalaryRounded,
                      taxableEarnings,
                      incomeTaxRounded,
                      pensionTaxRounded,
                      grossSalary,
                    );

                    // Show success message
                    Get.snackbar(
                        backgroundColor: inactiveButtonColor,
                        'Success',
                        'Employee data stored successfully');

                    // Clear the form fields
                    _employeeNameController.clear();
                    _emailAddressController.clear();
                    _phoneNumberController.clear();
                    _tinNumberController.clear();
                    _grossSalaryController.clear();
                    _taxableEarningsController.clear();
                    _startingDateOfSalaryController.clear();

                    // Navigate to the employee detail page
                    Get.toNamed('/employee_detail');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: PrimaryButton(
                        text: "Add employee",
                        color: _isFormValid.value == true
                            ? primaryColor
                            : inactiveButtonColor,
                        textColor: _isFormValid.value
                            ? white
                            : inactiveTextColorForButton),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
