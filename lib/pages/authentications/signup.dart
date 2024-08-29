import 'package:demoze/utils/constants.dart';
import 'package:demoze/widgets/custom_buttons.dart';
import 'package:demoze/widgets/custom_form.dart';
import 'package:demoze/widgets/custom_texts.dart';
import 'package:demoze/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RxBool _isFormValid = false.obs;

  void _validateForm() {
    _isFormValid.value =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    print("value:${_isFormValid} :");
  }
  // const Login({super.key});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(33, 64, 7, 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child:
                    Image.asset(width: 64, height: 74, 'assets/icons/logo.png'),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeadingText("Welcome"),
                  HorizontalSpace(20),
                  Image.asset(height: 50, width: 50, 'assets/icons/wave.png')
                ],
              ),
              Row(
                children: [
                  HeadingText('to'),
                  HorizontalSpace(5),
                  Text(
                    'Demoz Payroll',
                    style: GoogleFonts.lexend(
                        color: primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )

              //RIch text removed //
              // RichText(
              //     text: TextSpan(children: [
              //   TextSpan(
              //       text: "to",
              //       style: GoogleFonts.lexend(
              //           fontSize: 28, fontWeight: FontWeight.w500)),
              //   TextSpan(
              //       text: "Demoz payroll",
              //       style: GoogleFonts.lexend(
              //           fontSize: 20, fontWeight: FontWeight.normal))
              // ])),
              ,
              SubText("Hello there ,Sign uo to continue"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 16),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _emailController,
                    isPasswordVissible: false,
                    labelText: "Email Address",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  width: 335,
                  height: 56,
                  child: CustomForm(
                    controller: _passwordController,
                    isPasswordVissible: true,
                    labelText: "Password",
                  ),
                ),
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () => Get.toNamed('/registration'),
                  child: PrimaryButton(
                      text: "Sign up",
                      color: _isFormValid.value == true
                          ? primaryColor
                          : inactiveButtonColor,
                      textColor: _isFormValid.value
                          ? white
                          : inactiveTextColorForButton),
                );
              }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: HorizontalLine(height: 1, width: 140),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SubText("Or continue with social account"),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: HorizontalLine(height: 1, width: 150),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 335,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border:
                        Border.all(color: Color.fromRGBO(172, 175, 181, 0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          width: 24, height: 24, 'assets/icons/google.png'),
                      HorizontalSpace(10),
                      Text(
                        "Google",
                        style: GoogleFonts.lexend(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  )),
              // Flexible(child: Container()),
              VerticalSpace(size.height * 0.21),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalAppText(
                        text: "Did you already have an account?",
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                    HorizontalSpace(7),

                    GestureDetector(
                      onTap: () {},
                      child: NormalAppText(
                          textColor: primaryColor,
                          text: "Login",
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    )
                    // Text("Did you already have an account? "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
