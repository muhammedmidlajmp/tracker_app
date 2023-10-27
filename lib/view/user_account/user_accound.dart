import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:kt_telematic_solutions/model/core/colors.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const Scaffold(
        backgroundColor: scafoldBackgroundColor,
        body: Center(
          child: Text('Account Screen'),
        ),
      ),
    );
  }
}
