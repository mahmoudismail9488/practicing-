import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/auth%20cycle/models/vendor_categories.dart';
import 'package:new_app/app/auth%20cycle/views/sign_in_screen.dart';
import 'package:new_app/app/auth%20cycle/widget/auth_appbar.dart';
import 'package:new_app/app/auth%20cycle/widget/brands_chips.dart';
import 'package:new_app/app/auth%20cycle/widget/custom_dropdown.dart';
import 'package:new_app/widgets/next_button.dart';

import 'package:new_app/styles/colors.dart';
import 'package:new_app/widgets/main_page.dart';
import 'package:new_app/widgets/message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  String? dropDownValue;
  bool passObsecureState = true;
  bool confirmPassObsecureState = true;
  List<VendorBrands> selectedBrands = [];
  final egyptPhoneRegex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');

  void createAccount(context) {
    final myKeyState = formKey.currentState!.validate();
    if (selectedBrands.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Select Category")));
      return;
    }
    if (myKeyState == true) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Message(
            text: "Congrats you're now a rawmart partner",
            image: Image.asset("assets/imgs/succes.png"),
            callBack: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => MainPage()),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthAppbar(
              title: "Create Account",
              subTitle: "Get Started with Rawmart",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
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
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length > 5) {
                          return null;
                        }
                        return "You Must Enter your Name with more than 5 chars";
                      },
                      maxLines: 1,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      keyboardType: TextInputType.text,
                      cursorWidth: 2,
                      autofocus: true,
                      cursorColor: Theme.of(context).primaryColor,
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            hint: Text("Enter Your Name"),
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              color: lightFormLabelColor,
                            ),
                          ),
                    ),

                    // phone number field
                    Text(
                      "Phone Number",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            egyptPhoneRegex.hasMatch(value)) {
                          return null;
                        }
                        return "You Must Enter Valid phone number";
                      },
                      maxLines: 1,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      keyboardType: TextInputType.phone,
                      cursorWidth: 2,
                      cursorColor: Theme.of(context).primaryColor,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            hint: Text("+02  0xx xxx xxxx"),
                            prefixIcon: Icon(
                              Icons.call_outlined,
                              color: lightFormLabelColor,
                            ),
                          ),
                    ),
                    // category section to select brands based on category
                    Text(
                      "Select Category",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    DropdownButtonFormField(
                      hint: Text(
                        "Select Category",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      value: dropDownValue,
                      items: categories
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.title),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value;
                        });
                      },
                      alignment: AlignmentDirectional.topStart,
                      menuMaxHeight: 150,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(12),
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                    ),

                    //Brands based on category
                    if (dropDownValue != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Brands",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDropdown(
                                hint: "Select Brands",
                                choices: brands
                                    .where((e) => e.categoryId == dropDownValue)
                                    .toList(),
                                multiSelect: true,
                                callBack: (value) {
                                  setState(() {
                                    selectedBrands = value;
                                  });
                                },
                              ),
                              SizedBox(height: 8),

                              // add selected categories as chips
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: selectedBrands
                                      .map(
                                        (ele) => BrandsChips(text: ele.title),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      controller: passController,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: lightFormLabelColor,
                            ),
                            hint: Text("Enter your password"),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passObsecureState = !passObsecureState;
                                });
                              },
                              icon: Icon(
                                passObsecureState
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                              ),
                            ),
                          ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length > 8) {
                          return null;
                        }
                        return "You Must Enter your Password with more than 8 chars";
                      },
                      obscureText: passObsecureState,
                    ),

                    Text(
                      "Confirm Password",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      controller: confirmPassController,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: lightFormLabelColor,
                            ),
                            hint: Text("Enter your password"),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  confirmPassObsecureState =
                                      !confirmPassObsecureState;
                                });
                              },
                              icon: Icon(
                                confirmPassObsecureState
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                              ),
                            ),
                          ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == passController.text) {
                          return null;
                        }
                        return "Password Must Match";
                      },
                      obscureText: confirmPassObsecureState,
                    ),

                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: NextButton(
                        nextFunction: () {
                          createAccount(context);
                        },
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
          ],
        ),
      ),
    );
  }
}
