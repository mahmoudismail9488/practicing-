import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/auth%20cycle/models/vendor_categories.dart';
import 'package:new_app/app/auth%20cycle/views/sign_in_screen.dart';
import 'package:new_app/app/auth%20cycle/widget/auth_appbar.dart';
import 'package:new_app/app/auth%20cycle/widget/custom_text_field.dart';
import 'package:new_app/app/auth%20cycle/widget/next_button.dart';
import 'package:new_app/styles/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void createAccount() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppbar(
            title: "Create Account",
            subTitle: "Get Started with Rawmart",
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
                      "Name",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    CustomTextField(
                      controller: nameController,
                      icon: Icon(
                        Icons.person_2_outlined,
                        color: lightFormLabelColor,
                      ),
                      hint: "Enter Your Name",
                      validateTextField: (value) {},
                      capitalization: TextCapitalization.words,
                      type: TextInputType.name,
                    ),
                    // phone number field
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
                    //category
                    Text(
                      "select your business category",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    DropdownMenu(
                      width: double.infinity,
                      controller: categoryController,
                      selectedTrailingIcon: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      trailingIcon: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCBD2D6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "Select your category",
                      dropdownMenuEntries: categories
                          .map(
                            (e) =>
                                DropdownMenuEntry(value: e.id, label: e.title),
                          )
                          .toList(),
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
                    Text(
                      "Confirm password",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    CustomTextField(
                      controller: confirmPassController,
                      icon: Icon(
                        Icons.lock_outline,
                        color: lightFormLabelColor,
                      ),
                      hint: "Confirm password",
                      password: true,
                      type: TextInputType.none,
                      capitalization: TextCapitalization.none,
                      validateTextField: (value) {},
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: NextButton(
                        nextFunction: () {},
                        text: "Create Vendor Account",
                      ),
                    ),
                    Row(
                      spacing: 2,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account? ",
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
                                builder: (ctx) => SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
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
