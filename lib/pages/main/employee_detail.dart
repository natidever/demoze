import 'package:flutter/material.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('employee detail'),
            ),
          ],
        ),
      ),
    );
  }
}
