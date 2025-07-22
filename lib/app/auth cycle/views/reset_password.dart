import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/sign_in_screen.dart';
import 'package:new_app/app/auth%20cycle/widget/auth_appbar.dart';
import 'package:new_app/app/auth%20cycle/widget/next_button.dart';
import 'package:new_app/styles/colors.dart';
import 'package:new_app/widgets/message.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.phone});
  final String phone;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool passObsecureState = true;
  bool confirmPassObsecureState = true;
  void changePassword(context) {
    final myKeyState = formKey.currentState!.validate();
    if (myKeyState == true) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Message(
            text: "The password has been changed successfully",
            image: Image.asset("assets/imgs/suc.png"),
            callBack: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignInScreen(
                    phone: widget.phone,
                    pass: passController.text,
                  ),
                ),
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
      body: Column(
        children: [
          AuthAppbar(
            title: "reset password",
            subTitle: "enter your new password below, to change your password",
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
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: passController,
                      cursorColor: Theme.of(context).primaryColor,
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
                                color: smallTitleColor,
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
                      textInputAction: TextInputAction.done,
                      controller: confirmPassController,
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
                                color: smallTitleColor,
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
                          changePassword(context);
                        },
                        text: "Confirm",
                      ),
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
