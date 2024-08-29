import 'package:demoze/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomForm extends StatelessWidget {
  TextEditingController controller;
  bool isPasswordVissible;

  CustomForm(this.controller, this.isPasswordVissible);

  final formController = Get.find<FormController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: formController.isPasswordVissible.isTrue ? false : true,
      // obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: InputBorder.none,
          prefixIconConstraints: BoxConstraints(
            maxHeight: 30,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Image.asset('assets/images/icons/password.png'),
          ),
          // prefixIconColor: subTextColor,
          suffixIcon: IconButton(
              onPressed: () {
                formController.TogglePasswordVissiblity();
              },
              icon: Icon(
                  // color: subTextColor,
                  //Toggle between two icons based on the password is vissible or not
                  formController.isPasswordVissible.value == false
                      ? Icons.visibility
                      : Icons.visibility_off)),
          hintStyle: GoogleFonts.sourceSans3(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          hintText: 'Password'),
    );
    ();
  }
}
