import 'package:Demoz/controller/form_controller.dart';
import 'package:Demoz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomForm extends StatefulWidget {
  TextEditingController? controller;
  bool? isPasswordVissible;
  String? labelText;
  // void Function(String)? ontap;
  // final Future<void> Function()? ontap;
  VoidCallback? ontap;
  String? hintText;
  CustomForm(
      {this.ontap,
      this.labelText,
      this.controller,
      this.isPasswordVissible,
      this.hintText});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  final FocusNode _focusNode = FocusNode();

  bool _isFocused = false;

  final formController = Get.find<FormController>();

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Text(
        'Password',
        style: GoogleFonts.lexend(
          textStyle: TextStyle(
            textBaseline: TextBaseline.ideographic,
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: _isFocused
                ? Colors.blue
                : Colors.grey, // Label color based on focus
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TextFormField
        TextFormField(
          // onTap: () => widget.ontap,
          onTap: widget.ontap,
          // () {
          //   if (widget.controller != null) {
          //     formController.showDatePicker(context, widget.controller!);
          //   }
          // },
          style: GoogleFonts.lexend(
            fontSize: 14,
            color: Color.fromRGBO(16, 19, 23, 1),
            fontWeight: FontWeight.w300,
          ),
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: formController.isPasswordVissible == true ? true : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            // alignLabelWithHint: true,
            // contentPadding: EdgeInsets.fromLTRB(8, 90, 0, 0), // Adjust padding
            contentPadding: EdgeInsets.fromLTRB(15, 50, 0, 0), // Ad ,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromRGBO(218, 218, 218, 1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    formController.TogglePasswordVissiblity();
                    print(formController.isPasswordVissible);
                  });
                },
                icon: widget.isPasswordVissible == true
                    ? Icon(
                        color: black,
                        formController.isPasswordVissible == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      )
                    : Text('')),
            border: InputBorder.none,
          ),
        ),
        // Label always visible
        Positioned(
          left: 16,
          top: 8, // Adjust position based on focus
          child: AnimatedOpacity(
            opacity: 1.0, // Always visible
            duration: Duration(milliseconds: 200),
            child: Text(
              widget.labelText ?? '',
              style: GoogleFonts.lexend(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  color: _isFocused
                      ? Colors.blue
                      : const Color.fromARGB(
                          255, 0, 0, 0), // Change color based on focus
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
