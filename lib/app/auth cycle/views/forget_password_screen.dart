import 'package:flutter/material.dart';
import 'package:new_app/app/auth cycle/widget/auth_appbar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppbar(
            title: "forget password",
            subTitle: "enter your phone number below to reset your password",
          ),
        ],
      ),
    );
  }
}
