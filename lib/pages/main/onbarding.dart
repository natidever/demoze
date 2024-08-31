import 'package:Demoz/utils/constants.dart';
import 'package:Demoz/widgets/custom_buttons.dart';
import 'package:Demoz/widgets/custom_texts.dart';
import 'package:Demoz/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final GlobalKey _imageKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showSplashBottomSheet(BuildContext context) {
    // Start the bounce animation when the bottom sheet appears
    _controller.forward(from: 0.0);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 310,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 40, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Easy way to pay your tax ontime",
                  style: GoogleFonts.lexend(
                      fontSize: 28, fontWeight: FontWeight.w500),
                ),
                // HeadingText("Easy way to pay your tax ontime"),
                SizedBox(
                  height: 10,
                ),
                SubText(
                    "It is a longestablished fact that paying tas and other payments will be tedious process to keep up"),

                VerticalSpace(20),
                Row(
                  children: [
                    SizedBox(
                        width: 135,
                        height: 56,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/signup");
                          },
                          child: PrimaryButton(
                              text: "Login",
                              color: inactiveButtonColor,
                              textColor: black),
                        )),
                    HorizontalSpace(MediaQuery.of(context).size.width * 0.12),
                    SizedBox(
                        width: 135,
                        height: 56,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/signup");
                          },
                          child: PrimaryButton(
                              text: "Sign up",
                              color: inactiveButtonColor,
                              textColor: black),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showSplashBottomSheet(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(87, 154, 252, 1.0),
        body: Center(
          child: AnimatedBuilder(
            key: _imageKey,
            animation: _animation,
            child: Image.asset('assets/icons/finalsplash1.png'),
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: 1.0 +
                    (_animation.value *
                        0.1), // Scale slightly for bounce effect
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
