import 'package:demoze/utils/constants.dart';
import 'package:demoze/widgets/cards.dart';
import 'package:demoze/widgets/custom_buttons.dart';
import 'package:demoze/widgets/custom_texts.dart';
import 'package:demoze/widgets/layout_helpers.dart';
import 'package:demoze/widgets/pichart_badget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      fontWeight: FontWeight.w300, fontSize: 14, text: "Past"),
                ],
              ),
            ),
            Container(
              width: 335,
              height: 170,
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
                        text: "AUG 28,2024- Sep 5, 2024"),
                    VerticalSpace(10),

                    // HorizontalLine(height: 1, width: 335),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            NormalAppText(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                text: "Income Tax"),
                            VerticalSpace(5),
                            NormalAppText(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                text: "4000 etb"),
                          ],
                        ),
                        Column(
                          children: [
                            NormalAppText(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                text: "Pension Tax"),
                            VerticalSpace(5),
                            NormalAppText(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                text: "5000 etb"),
                          ],
                        ),
                        // HorizontalSpace(12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalAppText(
                                textColor: Color.fromRGBO(255, 127, 116, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                text: "Augest"),
                            VerticalSpace(2),
                            NormalAppText(
                                textColor: Color.fromRGBO(255, 127, 116, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                text: "Tax on due"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 181,
                  height: 157,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11.0, 8, 8, 0),
                    child: Column(
                      children: [
                        NormalAppText(
                          text: "Employee Composition",
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                        Expanded(
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 30,
                              sections: showingSections(),
                            ),
                          ),
                        ),
                        Text(
                          '898 empoyee total',
                          style: GoogleFonts.lexend(
                              fontSize: 8,
                              fontWeight: FontWeight.w300,
                              color: subTextColor),
                        )
                      ],
                    ),
                  ),
                ),
                HorizontalSpace(10),

                //Tax summary
                Container(
                  width: 171,
                  height: 157,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NormalAppText(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            text: "Tax Summery"),
                        Row(
                          children: [
                            NormalAppText(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                text: "9,878.90"),
                            NormalAppText(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                text: " etb"),
                          ],
                        ),
                        Row(
                          children: [
                            NormalAppText(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textColor: Color.fromRGBO(37, 208, 54, 1),
                                text: "48.78%"),
                            Icon(
                              Icons.arrow_drop_up,
                              color: Color.fromRGBO(37, 208, 54, 1),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 30.0 : 20.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: i == 0
            ? Color.fromRGBO(89, 50, 234, 1)
            : Color.fromRGBO(22, 192, 152, 1),
        value: i == 0 ? 65 : 35,
        title: i == 0 ? '' : '',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
        badgeWidget: CustomBadge(
          badgeColor: i == 0
              ? Color.fromRGBO(89, 50, 234, 1)
              : Color.fromRGBO(84, 153, 137, 1),
          text: i == 0 ? '35%' : '65%',
          iconSource:
              i == 0 ? 'assets/icons/male.png' : 'assets/icons/female.png',
        ),
        badgePositionPercentageOffset: -4.3,
      );
    });
  }
}
