import 'package:demoze/controller/form_controller.dart';
import 'package:demoze/utils/constants.dart';
import 'package:demoze/widgets/custom_buttons.dart';
import 'package:demoze/widgets/custom_form.dart';
import 'package:demoze/widgets/custom_texts.dart';
import 'package:demoze/widgets/layout_helpers.dart';
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
        _startingDateOfSalaryController.text.isNotEmpty;

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
                    controller: _startingDateOfSalaryController,
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
                return PrimaryButton(
                    text: "Add employee",
                    color: _isFormValid.value == true
                        ? primaryColor
                        : inactiveButtonColor,
                    textColor: _isFormValid.value
                        ? white
                        : inactiveTextColorForButton);
              })
            ],
          ),
        ),
      ),
    );
  }
}
