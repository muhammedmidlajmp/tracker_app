import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kt_telematic_solutions/controller/provider/login_provider/botum_nav_provider/botomnav_provider.dart';
import 'package:kt_telematic_solutions/view/history/location_history.dart';
import 'package:kt_telematic_solutions/view/home/home_screen.dart';
import 'package:kt_telematic_solutions/view/user_account/user_accound.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final List<Widget> _pages = [const HomeScreen(), LocationListScreen(), AccountScreen()];

  MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<BotumNavProvider>(context);

    return Scaffold(
      body: _pages[myProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myProvider.selectedIndex,
        onTap: (index) {
          myProvider.setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
