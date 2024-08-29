import 'package:demoze/utils/constants.dart';
import 'package:demoze/widgets/custom_form.dart';
import 'package:demoze/widgets/custom_texts.dart';
import 'package:demoze/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    ;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(33, 64, 7, 15),
        child: Column(
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
            Container(
              width: 335,
              height: 56,
              child: CustomForm(
                controller: emailController,
                isPasswordVissible: false,
                labelText: "Email Address",
              ),
            )
          ],
        ),
      ),
    );
  }
}
