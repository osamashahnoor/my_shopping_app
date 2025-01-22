import 'package:flutter/material.dart';
import 'package:my_shopping_app/api/login.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:my_shopping_app/screen/all_product.dart';
import 'package:my_shopping_app/widget/bottun.dart';
import 'package:my_shopping_app/widget/container.dart';
import 'package:my_shopping_app/widget/text.dart';
import 'package:my_shopping_app/widget/textfromfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              width: 100.w,
              height: 40.h,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF188095),
                  Color(0xFF2AB3C6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 6.h,
                      ),
                      child: CustomText(
                        text: 'STC',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'font',
                      ),
                    ),
                  ),
                  Center(
                    child: CustomText(
                      text: 'HEALTH',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'font',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      top: 10.h,
                    ),
                    child: CustomText(
                      text: 'Log In',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'font',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Textfrom(
                      controller: emailController,
                      text: "Email",
                      isObcure: false,
                      passwordVisibl: false,
                      icon: Icon(Icons.check, color: Colors.blue, size: 18.px),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter an email";
                        } else if (!RegExp(r"^[a-zA-Z0-9._%+-]")
                            .hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      style: TextStyle(fontSize: 16.sp),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 16.sp),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 18.sp,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a password";
                        } else if (value.length < 2) {
                          return "Password must be at least 2 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Bouton(
                      text: 'Login',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          loginToApi(
                                  emailController.text, passwordController.text)
                              .then((result) {
                            if (result.contains("successful")) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllProduct(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result),
                                ),
                              );
                            }
                          }).catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('An error occurred: $e'),
                              ),
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please correct the errors'),
                            ),
                          );
                        }
                      },
                      fixedSize: Size(85.w, 9.h),
                      color: const Color.fromARGB(255, 42, 179, 198),
                      fontFamily: 'font',
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: CustomText(
                        text: 'Need Help?',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'font',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
