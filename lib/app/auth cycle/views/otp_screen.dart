import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:new_app/app/auth cycle/widget/auth_appbar.dart';
import 'package:new_app/widgets/next_button.dart';
import 'dart:async';

import 'package:new_app/app/auth%20cycle/views/reset_password.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phone});
  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final egyptPhoneRegex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppbar(
            title: "forget password",
            subTitle:
                "Enter 4 digits code sent to your phone  in the space below",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OtpTextField(
                  autoFocus: true,
                  fieldWidth: 56,
                  numberOfFields: 4,
                  borderColor: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  borderWidth: 3,
                  focusedBorderColor: Theme.of(context).primaryColor,
                  cursorColor: Theme.of(
                    context,
                  ).primaryColor, //set to true to show as box or false 1to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    code += " ";
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        foregroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        if (_start == 0) {
                          setState(() {
                            _start = 20;
                            startTimer();
                          });
                        }
                      },

                      child: Text(
                        "Resend",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    Text("$_start"),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: NextButton(
                    nextFunction: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ResetPassword(phone: widget.phone),
                        ),
                      );
                    },
                    text: "Reset",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
