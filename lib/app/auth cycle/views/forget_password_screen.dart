import 'package:flutter/material.dart';
import 'package:new_app/app/auth cycle/widget/auth_appbar.dart';
import 'package:new_app/app/auth%20cycle/views/otp_screen.dart';
import 'package:new_app/app/auth%20cycle/widget/next_button.dart';
import 'package:new_app/styles/colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  final egyptPhoneRegex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');

  void reset(context) {
    final myKeyState = formKey.currentState!.validate();
    if (myKeyState == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => OtpScreen(phone: phoneController.text),
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
            title: "forget password",
            subTitle: "Enter your phone number below to reset your password",
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
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      style: Theme.of(context).textTheme.labelMedium,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      keyboardType: TextInputType.phone,
                      cursorWidth: 2,
                      cursorColor: Theme.of(context).primaryColor,
                      controller: phoneController,
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

                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: NextButton(
                        nextFunction: () {
                          reset(context);
                        },
                        text: "Reset",
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
