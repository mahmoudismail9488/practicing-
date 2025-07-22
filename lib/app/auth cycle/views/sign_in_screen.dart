import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/forget_password_screen.dart';
import 'package:new_app/app/auth%20cycle/views/sign_up_screen.dart';
import 'package:new_app/app/auth%20cycle/widget/auth_appbar.dart';
import 'package:new_app/app/auth%20cycle/widget/next_button.dart';
import 'package:new_app/app/profile%20cyle/views/profile_screen.dart';
import 'package:new_app/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.phone, this.pass});
  final String? phone;
  final String? pass;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool rememberMe = false;
  bool obsecureState = true;
  final egyptPhoneRegex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');
  void logIn(context) {
    final myKeyState = formKey.currentState!.validate();
    if (myKeyState == true) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => ProfileScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phone ?? "";
    passController.text = widget.pass ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppbar(
            title: "Welcome Back",
            subTitle: "Enter your details below to Sign In",
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
                      onSaved: (newValue) {},
                      cursorWidth: 2,
                      cursorColor: Theme.of(context).primaryColor,
                      autofocus: true,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            prefixIcon: Icon(
                              Icons.call_outlined,
                              color: lightFormLabelColor,
                            ),
                            hint: Text("+02  0xx xxx xxxx"),
                          ),
                    ),

                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      controller: passController,
                      style: Theme.of(context).textTheme.labelMedium,
                      textInputAction: TextInputAction.done,
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
                                  obsecureState = !obsecureState;
                                });
                              },
                              icon: Icon(
                                obsecureState
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: smallTitleColor,
                              ),
                            ),
                          ),
                      keyboardType: TextInputType.none,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length > 8) {
                          return null;
                        }
                        return "You Must Enter your Password with more than 8 chars";
                      },
                      obscureText: obsecureState,
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
                      child: NextButton(
                        nextFunction: () {
                          logIn(context);
                        },
                        text: "Sign In",
                      ),
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
