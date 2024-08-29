import 'package:demoze/utils/constants.dart';
import 'package:demoze/widgets/cards.dart';
import 'package:demoze/widgets/custom_buttons.dart';
import 'package:demoze/widgets/custom_texts.dart';
import 'package:demoze/widgets/layout_helpers.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: white,
        elevation: 0,
        backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingText('Home'),
                  Icon(Icons.settings, size: 25),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  DashboardCard(
                      borderColor: firstCardBorder,
                      backgroudColor: firstCardBackgroud,
                      textColor: primaryColor,
                      content: "20",
                      description: "Number of Employee"),
                  HorizontalSpace(20),
                  DashboardCard(
                      borderColor: secondCardBorder,
                      backgroudColor: secondCardBackgroud,
                      textColor: Color.fromRGBO(163, 209, 57, 1),
                      content: "200",
                      description: "Income Tax paied")
                ],
              ),
              VerticalSpace(10),
              Row(
                children: [
                  DashboardCard(
                      borderColor: thirdCardBorder,
                      backgroudColor: thirdardBackgroud,
                      textColor: Color.fromRGBO(48, 190, 182, 1),
                      content: "4",
                      description: "Pension Tax Paied"),
                  HorizontalSpace(20),
                  DashboardCard(
                      borderColor: fourthCardBorder,
                      backgroudColor: fourthardBackgroud,
                      textColor: fourthColor,
                      content: "200",
                      description: "Income Tax paied")
                ],
              ),
              VerticalSpace(30),
              Container(
                width: 335,
                height: 50,
                decoration: BoxDecoration(

                    // color: Colors.red
                    color: Color.fromRGBO(172, 175, 181, 0.05)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 111,
                        height: 50,
                        child: PrimaryButton(
                            color: primaryColor,
                            text: "Up Coming",
                            textColor: white)),
                    HorizontalSpace(20),
                    NormalAppText(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        text: "Past"),
                  ],
                ),
              ),
              Container(
                width: 335,
                height: 137,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalAppText(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              text: "Date"),
                          Container(
                            width: 68,
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(6, 3, 2, 2),
                              child: Text(
                                'pay now',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(
                                    255,
                                    127,
                                    116,
                                    1,
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(255, 216, 210, 1)),
                          )
                        ],
                      ),
                      HorizontalSpace(5),
                      NormalAppText(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          text: "AUG 28,2024- Sep 5, 2024")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
