import 'package:flutter/material.dart';
import 'package:kt_telematic_solutions/controller/firebase_auth/firebase_auth.dart';
import 'package:kt_telematic_solutions/controller/provider/login_provider/login_provider.dart';
import 'package:kt_telematic_solutions/model/core/colors.dart';
import 'package:kt_telematic_solutions/view/bottom_nav/bottum_nav.dart';
// import 'package:kt_telematic_solutions/view/home/home_screen.dart';
import 'package:kt_telematic_solutions/view/register/register.dart';
import 'package:kt_telematic_solutions/view/widget/text_form_field/text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
                  child: Consumer<LoginProvider>(
                    builder: (context, loginProviderModel, child) => Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 171, 209, 226),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Form(
                        key: loginKey,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: titleTextcolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              costomtextFormField(
                                  hintText: 'Email',
                                  controller:
                                      loginProviderModel.emailController,
                                  maxmumLength: null,
                                  keyboardType: TextInputType.emailAddress,
                                  valiidatorTxt: 'Email Requird'),
                              costomtextFormField(
                                  hintText: 'Password',
                                  controller:
                                      loginProviderModel.passwordController,
                                  maxmumLength: null,
                                  keyboardType: TextInputType.multiline,
                                  valiidatorTxt: 'Password Requird'),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Auth _auth = Auth();
                                    if (loginKey.currentState!.validate()) {
                                      _auth.signIn(
                                          loginProviderModel
                                              .emailController.text,
                                          loginProviderModel
                                              .passwordController.text);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyBottomNavigationBar(),
                                          ));
                                    }
                                  },
                                  child: const Text('Login')),
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
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterScreen(),
                                              ));
                                        }
                                      },
                                      child: const Text('Sign up'),
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
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
