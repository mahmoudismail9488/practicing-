import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/forget_password_screen.dart';
import 'package:new_app/app/auth%20cycle/views/sign_up_screen.dart';
import 'package:new_app/app/auth%20cycle/widget/auth_appbar.dart';
import 'package:new_app/app/auth%20cycle/widget/next_button.dart';
import 'package:new_app/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/auth cycle/widget/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppbar(
            title: "Welcome Back",
            subTitle: "enter your details below to sign in",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    // name text field
                    Text(
                      "Phone Number",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      capitalization: TextCapitalization.none,
                      validateTextField: (value) {},
                      icon: Icon(
                        Icons.call_outlined,
                        color: lightFormLabelColor,
                      ),
                      hint: "+02  0xx xxx xxxx",
                    ),

                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    CustomTextField(
                      controller: passController,
                      icon: Icon(
                        Icons.lock_outline,
                        color: lightFormLabelColor,
                      ),
                      hint: "Enter your password",
                      password: true,
                      type: TextInputType.none,
                      capitalization: TextCapitalization.none,
                      validateTextField: (value) {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Theme.of(context).primaryColor,
                              checkColor: lightLabelTextColor,
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            Text(
                              "Remember Me",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ForgetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: NextButton(nextFunction: () {}, text: "Sign In"),
                    ),
                    Row(
                      spacing: 2,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have An Account? ",
                          style: TextStyle(
                            color: smallTitleColor,
                            fontFamily: GoogleFonts.roboto.toString(),
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  fontFamily: GoogleFonts.roboto.toString(),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
