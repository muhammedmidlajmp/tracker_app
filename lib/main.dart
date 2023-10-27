import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kt_telematic_solutions/controller/provider/location/location_datalist_provider.dart';
import 'package:kt_telematic_solutions/controller/provider/login_provider/botum_nav_provider/botomnav_provider.dart';
import 'package:kt_telematic_solutions/controller/provider/login_provider/login_provider.dart';
import 'package:kt_telematic_solutions/controller/provider/register_provider/register_provider.dart';
import 'package:kt_telematic_solutions/firebase_options.dart';
// import 'package:kt_telematic_solutions/view/home/home_screen.dart';
import 'package:kt_telematic_solutions/view/login_page/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBFAqvDJxn3sVEQ01CHEpYRS9K1_-I_HJs',
    appId: '1:547841833460:android:ceff38b6b6d5438da9e1a1',
    messagingSenderId: '547841833460',
    projectId: 'kt-telematic-solutions',
    storageBucket: 'kt-telematic-solutions.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => BotumNavProvider()),
        ChangeNotifierProvider(create: (context) => LocationDataList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
