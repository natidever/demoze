import 'package:Demoz/controller/form_controller.dart';
import 'package:Demoz/utils/constants.dart';
import 'package:Demoz/widgets/custom_texts.dart';
import 'package:Demoz/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyProfile extends StatelessWidget {
  // const CompanyProfile({super.key});

  final controller = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: white,
        elevation: 0,
        backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 200, child: HeadingText('Company Profile')),
                  Icon(Icons.settings, size: 25),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              AssetImage('assets/icons/profileimg.png')),
                      Positioned(
                          top: 110,
                          left: 95,
                          child: Container(
                            width: 31,
                            height: 31,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(238, 137, 36, 1),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              color: white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              VerticalSpace(10),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: NormalAppText(
                    text: "Company Name",
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: SubText("HR Manager"),
              ),
              NormalAppText(
                  text: "Company  Email",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              VerticalSpace(8),
              Container(
                // color: Colors.red,

                width: 327,
                height: 54,
                child: TextFormField(
                  obscureText: false,

                  // obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(241, 236, 236, 1)),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Image.asset('assets/icons/email.png'),
                      ),
                      prefixIconColor: subTextColor,
                      // suffixIcon: IconButton(
                      //     onPressed: () {
                      //       controller.TogglePasswordVissiblity();
                      //     },
                      //     icon: Icon(
                      //         color: subTextColor,
                      //         //Toggle between two icons based on the password is vissible or not
                      //         controller.isPasswordVissible.value == false
                      //             ? Icons.visibility
                      //             : Icons.visibility_off)),
                      hintStyle: GoogleFonts.sourceSans3(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: subTextColor),
                      hintText: 'XXX@gmail.com'),
                ),
              ),
              VerticalSpace(10),
              NormalAppText(
                  text: "Phone Number",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              VerticalSpace(10),
              Container(
                // color: Colors.red,

                width: 327,
                height: 54,
                child: TextFormField(
                  obscureText: false,

                  // obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(241, 236, 236, 1)),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Image.asset('assets/icons/call.png'),
                      ),
                      prefixIconColor: subTextColor,
                      // suffixIcon: IconButton(
                      //     onPressed: () {
                      //       controller.TogglePasswordVissiblity();
                      //     },
                      //     icon: Icon(
                      //         color: subTextColor,
                      //         //Toggle between two icons based on the password is vissible or not
                      //         controller.isPasswordVissible.value == false
                      //             ? Icons.visibility
                      //             : Icons.visibility_off)),
                      hintStyle: GoogleFonts.sourceSans3(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: subTextColor),
                      hintText: '+251900112244'),
                ),
              ),
              VerticalSpace(10),
              NormalAppText(
                  text: "Company Address ",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              VerticalSpace(10),
              Container(
                // color: Colors.red,

                width: 327,
                height: 54,
                child: TextFormField(
                  obscureText: false,

                  // obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(241, 236, 236, 1)),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                      ),
                      // prefixIcon: Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      //   child: Image.asset('assets/icons/call.png'),
                      // ),
                      prefixIconColor: subTextColor,
                      // suffixIcon: IconButton(
                      //     onPressed: () {
                      //       controller.TogglePasswordVissiblity();
                      //     },
                      //     icon: Icon(
                      //         color: subTextColor,
                      //         //Toggle between two icons based on the password is vissible or not
                      //         controller.isPasswordVissible.value == false
                      //             ? Icons.visibility
                      //             : Icons.visibility_off)),
                      hintStyle: GoogleFonts.sourceSans3(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: subTextColor),
                      hintText: 'Somewhere'),
                ),
              ),
              VerticalSpace(10),
              NormalAppText(
                  text: "Number Of Employee",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              VerticalSpace(10),
              Container(
                // color: Colors.red,

                width: 327,
                height: 54,
                child: TextFormField(
                  obscureText: false,

                  // obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(241, 236, 236, 1)),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                      ),
                      // prefixIcon: Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      //   child: Image.asset('assets/icons/call.png'),
                      // ),
                      prefixIconColor: subTextColor,
                      // suffixIcon: IconButton(
                      //     onPressed: () {
                      //       controller.TogglePasswordVissiblity();
                      //     },
                      //     icon: Icon(
                      //         color: subTextColor,
                      //         //Toggle between two icons based on the password is vissible or not
                      //         controller.isPasswordVissible.value == false
                      //             ? Icons.visibility
                      //             : Icons.visibility_off)),
                      hintStyle: GoogleFonts.sourceSans3(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: subTextColor),
                      hintText: '20'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
