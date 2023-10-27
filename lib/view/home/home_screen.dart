import 'package:flutter/material.dart';
import 'package:kt_telematic_solutions/model/core/colors.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: scafoldBackgroundColor,
          body: ListView(),
        );
      },
    );
  }
}
