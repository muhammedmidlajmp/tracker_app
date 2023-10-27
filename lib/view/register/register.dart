import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kt_telematic_solutions/controller/firebase_auth/firebase_auth.dart';
import 'package:kt_telematic_solutions/controller/provider/register_provider/register_provider.dart';
import 'package:kt_telematic_solutions/model/core/colors.dart';
import 'package:kt_telematic_solutions/view/bottom_nav/bottum_nav.dart';
import 'package:kt_telematic_solutions/view/home/home_screen.dart';
// import 'package:kt_telematic_solutions/view/home/home_screen.dart';
import 'package:kt_telematic_solutions/view/login_page/login.dart';
// import 'package:kt_telematic_solutions/view/widget/text_form_field/text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Auth _auth = Auth();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController rgisterPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    registerEmailController.dispose();
    rgisterPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: scafoldBackgroundColor,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 171, 209, 226),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                        key: registerKey,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: titleTextcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: usernameController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'username Required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: registerEmailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Email ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: rgisterPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: _signUp,
                                child: const Text('Register')),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 22, 20, 141)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ));
                                    },
                                    child: const Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _signUp() async {
    String userName = usernameController.text;
    String email = registerEmailController.text;
    String password = rgisterPasswordController.text;
    User? user = await _auth.signUp(email, password);
    if (user != null) {
      CoolAl
      print('User Successfully Created');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyBottomNavigationBar(),
          ),
          (route) => false);
    }
  }
}
